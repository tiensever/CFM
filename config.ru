# This file is used by Rack-based servers to start the application.

require 'cfm' # this is to load cfm.rb

require ::File.expand_path('../config/environment',  __FILE__)
run Movies::Application
