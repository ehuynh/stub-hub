require 'spec_helper'

require 'stubhub/file_store'
require 'fakefs/spec_helpers'

describe Stubhub::FileStore do

	include FakeFS::SpecHelpers

	it "returns an empty stubbed response if no matching stub file found" do
  	fs = Stubhub::FileStore.new(".")
  	response = fs.file_for_uri("test")
  	expect(response).to be_empty
	end

  it "returns a stubbed response of the file located in the seed directory matching the uri where the seed directory is the current directory" do
		File.write("test", "hello world")
  	fs = Stubhub::FileStore.new(".")
  	response = fs.file_for_uri("test")
  	expect(response.contents).to eq("hello world")
  end

  it "returns a stubbed response of stub file located in the seed directory matching the uri where the seed directory is not the current directory" do
  	FileUtils.mkdir_p("/path/to/seed/dir/")
  	File.write("/path/to/seed/dir/test", "hello world")
  	fs = Stubhub::FileStore.new("/path/to/seed/dir")
  	response = fs.file_for_uri("test")
  	expect(response.contents).to eq("hello world")
  end

end
