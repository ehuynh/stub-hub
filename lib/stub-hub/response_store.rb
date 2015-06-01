require 'rubygems'
require 'psych'

module Stubhub
  StubResponse = Struct.new(:contents) do

    def empty?
      contents == nil
    end

    def self.empty_response
      self.new
    end

  end
  
  StubEntry = Struct.new(:file_path)

  class StubDataStore

    def initialize(datastore_file)
      @curr_dir = File.dirname(datastore_file)
      @yml = Psych.load_file(datastore_file)
    end

    def stub_entry_for_uri uri
      entry = @yml['responses'][uri]
      if entry 
        file_path = File.join(@curr_dir, entry['path'])
        StubEntry.new(file_path) 
      else 
        nil 
      end
    end

  end

  class ResponseStore 

    def initialize(seed_directory)
      @seed_directory = File.expand_path(seed_directory)
      @datastore = StubDataStore.new(File.join(@seed_directory, "stubhub.yml"))
    end

    def response_for_uri uri
      stub_entry = @datastore.stub_entry_for_uri(uri)
      if stub_entry then stub_response(stub_entry) else empty_response end
    end

    private

    def stub_response stub_entry 
      contents = File.open(stub_entry.file_path, "r").read
      StubResponse.new(contents)
    end

    def empty_response
      StubResponse.empty_response
    end
  end

end
