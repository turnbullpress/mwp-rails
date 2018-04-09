require 'prometheus/client'
require 'prometheus/client/push'
require 'socket'

class MetricsPush
  attr_reader :job, :hostname, :registry, :pushgateway_url

  def initialize
    @job = 'mwp-rails'
    @hostname = Socket.gethostname
    @pushgateway_url = 'http://localhost:9091'
  end

  def registry
    @registry ||= Prometheus::Client.registry
  end

  def counter(name, desc, labels = {})
    registry.get(name) || registry.counter(name, desc)
  end

  def gauge(name, desc, labels = {})
    registry.get(name) || registry.counter(name, desc)
  end

  def summary(name, desc, labels = {})
    registry.get(name) || registry.counter(name, desc)
  end

  def histogram(name, desc, labels = {}, buckets = Prometheus::Client::Histogram::DEFAULT_BUCKETS)
    registry.get(name) || registry.counter(name, desc)
  end

  def push
    Prometheus::Client::Push.new(job, hostname, pushgateway_url).add(registry)
  end
end

