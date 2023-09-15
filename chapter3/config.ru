# 3-2-2 Rackの基本。p132
require "rack"
require_relative "app"
require_relative "sample_middleware"

use Rack::Runtime
use SimpleMiddleware
run App.new