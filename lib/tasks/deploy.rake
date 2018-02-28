require 'prometheus/client'
require 'prometheus/client/push'
namespace :deploy do
  desc "Deploy the mwp-rails application"
  task :release do
    # Your deployment code would go here

    Rake::Task["deploy:notify"].invoke
  end

  desc "Notify Prometheus of a deployment"
  task :notify do
  end
end
