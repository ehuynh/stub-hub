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
	  	stub_file = @file_store.file_for_uri req.path_info
	  	[200, {"Content-Type" => "text/json"}, [File.open(stub_file, "r").read]]
	  end
	end
end