require 'rack'
require 'thor'
require 'stubhub/app'

module Stubhub
  class CLI < Thor
    desc "start", "Starts the server"
	  method_option :"seed-dir", :aliases => "-s", :desc => "path to directory which contains the stub content"
    def start
    	seed_directory = options[:"seed-dir"] ? options[:"seed-dir"] : "."
      Rack::Server.start(
        :app => Stubhub::App.new(seed_directory)
      )
    end
  end
end
