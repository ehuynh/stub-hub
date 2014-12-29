require 'spec_helper'

require 'stubhub/file_store'
require 'fakefs/spec_helpers'

describe Stubhub::FileStore do

	include FakeFS::SpecHelpers

	it "returns an empty stubbed response if no matching stub file found" do
  	fs = Stubhub::FileStore.new
  	response = fs.file_for_uri("test")
  	expect(response).to be_empty
	end

  it "returns the stubbed response of the stub file located in the current directory matching the uri" do
		File.write("test", "hello world")
  	fs = Stubhub::FileStore.new
  	response = fs.file_for_uri("test")
  	expect(response.contents).to eq("hello world")
  end

end
