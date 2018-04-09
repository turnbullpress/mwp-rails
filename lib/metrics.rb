module Metrics
  def self.counter(name, docstring, base_labels = {})
    provide_metric(name) || registry.counter(name, docstring, base_labels)
  end

  def self.summary(name, docstring, base_labels = {})
    provide_metric(name) || registry.summary(name, docstring, base_labels)
  end

  def self.gauge(name, docstring, base_labels = {})
    provide_metric(name) || registry.gauge(name, docstring, base_labels)
  end

  def self.histogram(name, docstring, base_labels = {}, buckets = ::Prometheus::Client::Histogram::DEFAULT_BUCKETS)
    provide_metric(name) || registry.histogram(name, docstring, base_labels, buckets)
  end

  private

  def provide_metric(name)
    registry.get(name)
  end

  def registry
    @registry ||= ::Prometheus::Client.registry
  end
end
