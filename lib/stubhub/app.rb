require 'rack'
require 'stubhub/file_store'

module Stubhub
	class App
		attr_accessor :file_store

		def initialize
			@file_store = FileStore.new
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
