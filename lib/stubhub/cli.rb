require 'rack'
require 'thor'
require 'stubhub/app'

module Stubhub
  class CLI < Thor
    desc "start", "Starts the server"
    def start
      Rack::Server.start(
        :app => Stubhub::App.new
      )
    end
  end
end
