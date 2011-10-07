# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rest-more"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = [
  "Cardinal Blue",
  "Lin Jen-Shin (godfat)"]
  s.date = "2011-10-08"
  s.description = "Modular Ruby clients for REST APIs\n\nThere has been an explosion in the number of REST APIs available today.\nTo address the need for a way to access these APIs easily and elegantly,\nwe have developed [rest-core][], which consists of composable middleware\nthat allows you to build a REST client for any REST API. Or in the case of\ncommon APIs such as Facebook, Github, and Twitter, you can simply use the\nbuilt-in dedicated clients provided by rest-core.\n\n[rest-core]: http://github.com/cardinalblue/rest-core"
  s.email = ["dev (XD) cardinalblue.com"]
  s.files = [
  ".gitmodules",
  "CHANGES.md",
  "Gemfile",
  "LICENSE",
  "README.md",
  "Rakefile",
  "TODO.md",
  "example/facebook.rb",
  "example/github.rb",
  "example/linkedin.rb",
  "example/rails2/Gemfile",
  "example/rails2/Gemfile.lock",
  "example/rails2/README",
  "example/rails2/Rakefile",
  "example/rails2/app/controllers/application_controller.rb",
  "example/rails2/app/views/application/helper.html.erb",
  "example/rails2/config/boot.rb",
  "example/rails2/config/environment.rb",
  "example/rails2/config/environments/development.rb",
  "example/rails2/config/environments/production.rb",
  "example/rails2/config/environments/test.rb",
  "example/rails2/config/initializers/cookie_verification_secret.rb",
  "example/rails2/config/initializers/new_rails_defaults.rb",
  "example/rails2/config/initializers/session_store.rb",
  "example/rails2/config/preinitializer.rb",
  "example/rails2/config/rest-core.yaml",
  "example/rails2/config/routes.rb",
  "example/rails2/log",
  "example/rails2/test/functional/application_controller_test.rb",
  "example/rails2/test/test_helper.rb",
  "example/rails2/test/unit/rails_util_test.rb",
  "example/rails3/Gemfile",
  "example/rails3/Gemfile.lock",
  "example/rails3/README",
  "example/rails3/Rakefile",
  "example/rails3/app/controllers/application_controller.rb",
  "example/rails3/app/views/application/helper.html.erb",
  "example/rails3/config.ru",
  "example/rails3/config/application.rb",
  "example/rails3/config/boot.rb",
  "example/rails3/config/environment.rb",
  "example/rails3/config/environments/development.rb",
  "example/rails3/config/environments/production.rb",
  "example/rails3/config/environments/test.rb",
  "example/rails3/config/initializers/secret_token.rb",
  "example/rails3/config/initializers/session_store.rb",
  "example/rails3/config/rest-core.yaml",
  "example/rails3/config/routes.rb",
  "example/rails3/test/functional/application_controller_test.rb",
  "example/rails3/test/test_helper.rb",
  "example/rails3/test/unit/rails_util_test.rb",
  "example/sinatra/config.ru",
  "example/twitter.rb",
  "lib/rest-core/client/facebook.rb",
  "lib/rest-core/client/facebook/rails_util.rb",
  "lib/rest-core/client/flurry.rb",
  "lib/rest-core/client/flurry/rails_util.rb",
  "lib/rest-core/client/github.rb",
  "lib/rest-core/client/linkedin.rb",
  "lib/rest-core/client/mixi.rb",
  "lib/rest-core/client/simple.rb",
  "lib/rest-core/client/twitter.rb",
  "lib/rest-core/client/universal.rb",
  "lib/rest-more.rb",
  "lib/rest-more/version.rb",
  "task/.gitignore",
  "task/gemgem.rb",
  "test/client/facebook/config/rest-core.yaml",
  "test/client/facebook/test_api.rb",
  "test/client/facebook/test_cache.rb",
  "test/client/facebook/test_default.rb",
  "test/client/facebook/test_error.rb",
  "test/client/facebook/test_handler.rb",
  "test/client/facebook/test_load_config.rb",
  "test/client/facebook/test_misc.rb",
  "test/client/facebook/test_oauth.rb",
  "test/client/facebook/test_old.rb",
  "test/client/facebook/test_page.rb",
  "test/client/facebook/test_parse.rb",
  "test/client/facebook/test_serialize.rb",
  "test/client/facebook/test_timeout.rb",
  "test/client/flurry/test_metrics.rb",
  "test/client/twitter/test_api.rb"]
  s.homepage = "https://github.com/cardinalblue/rest-more"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "Modular Ruby clients for REST APIs"
  s.test_files = [
  "test/client/facebook/test_api.rb",
  "test/client/facebook/test_cache.rb",
  "test/client/facebook/test_default.rb",
  "test/client/facebook/test_error.rb",
  "test/client/facebook/test_handler.rb",
  "test/client/facebook/test_load_config.rb",
  "test/client/facebook/test_misc.rb",
  "test/client/facebook/test_oauth.rb",
  "test/client/facebook/test_old.rb",
  "test/client/facebook/test_page.rb",
  "test/client/facebook/test_parse.rb",
  "test/client/facebook/test_serialize.rb",
  "test/client/facebook/test_timeout.rb",
  "test/client/flurry/test_metrics.rb",
  "test/client/twitter/test_api.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-core>, [">= 0"])
    else
      s.add_dependency(%q<rest-core>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-core>, [">= 0"])
  end
end
