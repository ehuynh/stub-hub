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

  class ResponseStore 

    def initialize(seed_directory)
      @seed_directory = File.expand_path(seed_directory)
    end

    def response_for_uri uri
      if can_respond? uri then stub_response uri else empty_response end
    end

    private

    def can_respond? uri
      File.exists?(file_for_uri uri)
    end

    def file_for_uri uri
      File.join(@seed_directory, file_name_for_uri(uri))
    end

    def file_name_for_uri uri
      uri.sub(/^\//, "").sub(/\/$/, "").gsub(/\//, "-")
    end

    def stub_response uri
      contents = File.open(file_for_uri(uri), "r").read
      StubResponse.new(contents)
    end

    def empty_response
      StubResponse.empty_response
    end
  end
end
