module Skynet::ObjectExtensions
  
  def send_later(method, *arguments, &block)
    
    raise ArgumentError("send_later can not serialize blocks.") if block_given?

    if is_a?(Class)
      data = {
        :class_name => name,
        :method     => method,
        :arguments  => arguments
      }.to_yaml
    else
      data = {
        :object    => self,
        :method    => method,
        :arguments => arguments
      }.to_yaml
    end

    jobopts = {
      :single                => true,
      :mappers               => 1,
      :map_data              => [data],
      :name                  => "send_later #{self.class}##{method}",
      :map_name              => "",
      :map_timeout           => 60,
      :reduce_timeout        => 60,
      :master_timeout        => 60,
      :master_result_timeout => 1.minute,
      :map_reduce_class      => Skynet::ObjectAsync,
      :master_retry          => 0,
      :map_retry             => 0
    }   
    job = Skynet::AsyncJob.new(jobopts)
    job.run

  end

  private
  
  def method_missing(method_id, *arguments, &block)
    return super unless method_id.to_s =~ /^(.*)_later$/
    send_later($1, *arguments)
  end
  
end

Object.send :include, Skynet::ObjectExtensions

class Skynet::ObjectAsync
  include SkynetDebugger

  class << self
    def map(datas)
      begin
        datas.each do |yaml|
          data = YAML.load(yaml)
          data[:object] = data[:class_name].constantize if data[:class_name]
          data[:object].send(data[:method], *data[:arguments])
        end
      rescue Exception => e
        error "Error in #{self} #{e.inspect} with data #{datas.inspect}"
      end
      return
    end
  end
end
