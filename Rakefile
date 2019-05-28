require "bundler/gem_tasks"
task :default => :spec

Rake::Task["release:rubygem_push"].clear
task "release:rubygem_push" do
  require_relative 'lib/lingorb/version'
  exec "gem push pkg/lingorb-#{Lingorb::VERSION}.gem"
end
