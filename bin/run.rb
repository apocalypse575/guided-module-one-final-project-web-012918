require 'artii'
require_relative '../config/environment'
require 'pry'
require 'rest-client'
new_cli = CommandLineInterface.new
# binding.pry

new_cli.run
