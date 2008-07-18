Gem::Specification.new do |s|
  s.name = %q{skynet}
  s.version = "0.9.317"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Pisoni", "Brendan Baldwin"]
  s.date = %q{2008-07-09}
  s.description = %q{Skynet - A Ruby Map/Reduce Framework}
  s.email = %q{apisoni@geni.com}
  s.executables = ["skynet", "skynet_install", "skynet_tuplespace_server"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "app_generators/skynet_install/USAGE", "app_generators/skynet_install/skynet_install_generator.rb", "app_generators/skynet_install/templates/migration.rb", "app_generators/skynet_install/templates/skynet_config.rb", "app_generators/skynet_install/templates/skynet_initializer.rb", "app_generators/skynet_install/templates/skynet_mysql_schema.sql", "bin/skynet", "bin/skynet_install", "bin/skynet_tuplespace_server", "config/hoe.rb", "config/requirements.rb", "extras/README", "extras/init.d/skynet", "extras/rails/controllers/skynet_controller.rb", "extras/rails/views/skynet/index.html.erb", "lib/skynet.rb", "lib/skynet/active_record_extensions.rb", "lib/skynet/config.rb", "lib/skynet/console.rb", "lib/skynet/console_helper.rb", "lib/skynet/debugger.rb", "lib/skynet/guid_generator.rb", "lib/skynet/job.rb", "lib/skynet/launcher.rb", "lib/skynet/logger.rb", "lib/skynet/manager.rb", "lib/skynet/mapreduce_helper.rb", "lib/skynet/mapreduce_test.rb", "lib/skynet/message_queue_adapters/message_queue_adapter.rb", "lib/skynet/message_queue_adapters/mysql.rb", "lib/skynet/message_queue_adapters/tuple_space.rb", "lib/skynet/message.rb", "lib/skynet/message_queue.rb", "lib/skynet/object_extensions.rb", "lib/skynet/partitioners.rb", "lib/skynet/ruby_extensions.rb", "lib/skynet/task.rb", "lib/skynet/tuplespace_server.rb", "lib/skynet/worker.rb", "lib/skynet/version.rb", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "skynet.gemspec", "tasks/deployment.rake", "tasks/environment.rake"]
  s.has_rdoc = true
  s.homepage = %q{http://skynet.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{skynet}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{Skynet - A Ruby Map/Reduce Framework}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_runtime_dependency(%q<daemons>, [">= 1"])
      s.add_runtime_dependency(%q<rubigen>, [">= 1.1.1"])
    else
      s.add_dependency(%q<daemons>, [">= 1"])
      s.add_dependency(%q<rubigen>, [">= 1.1.1"])
    end
  else
    s.add_dependency(%q<daemons>, [">= 1"])
    s.add_dependency(%q<rubigen>, [">= 1.1.1"])
  end
end
