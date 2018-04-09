namespace :deploy do
  desc "Deploy the mwp-rails application"
  task :release do
    # Your deployment code would go here

    Rake::Task["deploy:notify"].invoke
  end

  desc "Notify Prometheus of a deployment"
  task :notify do
    mp = MetricsPush.new
    mp.counter(:test, "A test counter for a job").increment({ service: 'mwp-rails-deploy', deployment_time: Time.now })
    mp.push
  end
end
