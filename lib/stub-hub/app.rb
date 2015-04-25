require 'rack'
require 'stub-hub/response_store'

module Stubhub
  class App
    attr_accessor :response_store

    def initialize(seed_directory)
      @response_store = ResponseStore.new(seed_directory)
    end

    def call(env)
      req = Rack::Request.new env
      stub_response = @response_store.response_for_uri req.path_info
      if !stub_response.empty?
        [200, {"Content-Type" => "text/json"}, [stub_response.contents]]
      else
        [404, {}, [""]]
      end
    end
  end
end
