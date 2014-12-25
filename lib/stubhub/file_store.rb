require 'rubygems'

module Stubhub
	class FileStore
		def file_for_uri uri
			uri.gsub(/^\//, "") << ".json"
		end
	end
end
