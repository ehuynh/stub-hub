require 'rack'
require 'stub-hub/file_store'

module Stubhub
	class App
		attr_accessor :file_store

		def initialize(seed_directory)
			@file_store = FileStore.new(seed_directory)
		end

	  def call(env)
	  	req = Rack::Request.new env
	  	stub_response = @file_store.file_for_uri req.path_info
	  	if !stub_response.empty?
	  		[200, {"Content-Type" => "text/json"}, [stub_response.contents]]
	  	else
	  		[404, {}, [""]]
	  	end
	  end
	end
end
