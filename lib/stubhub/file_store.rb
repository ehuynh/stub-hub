require 'rubygems'

module Stubhub
	StubResponse = Struct.new(:contents) do

		def empty?
			contents == nil
		end

		def self.empty_response
			self.new
		end

	end

	class FileStore

		def initialize(seed_directory)
			@seed_directory = seed_directory
		end

		def file_for_uri uri
			file_path = File.join(@seed_directory, uri)
			if File.exists?(file_path)
				contents = File.open(file_path, "r").read
				StubResponse.new(contents)
			else
				StubResponse.empty_response
			end
		end
	end
end
