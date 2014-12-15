require 'rack'
require 'thor'

module Stubhub
  class CLI < Thor
    desc "start", "Starts the server"
    def start
      Rack::Server.start(
        :app => lambda do |e|
          [200, {'Content-Type' => 'text/html'}, ['hello world']]
        end,
      )
    end

    def stop
    end
  end
end
