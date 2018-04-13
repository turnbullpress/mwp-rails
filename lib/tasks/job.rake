namespace :job do
  desc "Run a job the mwp-rails application"
  task :run do
    # Your job code would go here

    Rake::Task["job:notify"].invoke
  end

  desc "Notify Prometheus of a job"
  task :notify do
    mp = MetricsPush.new
    mp.counter(:test_counter, "A test counter for a job").increment({ service: 'mwp-rails-job' })
    mp.push
  end
end
