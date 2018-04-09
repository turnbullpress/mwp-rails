# Configure the Prometheus client
#
require 'prometheus/client'
require 'prometheus/client/push'

PROMETHEUS = Prometheus::Client.registry
