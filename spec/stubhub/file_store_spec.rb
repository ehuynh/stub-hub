require 'spec_helper'

require 'stub-hub/file_store'
require 'fakefs/spec_helpers'

describe Stubhub::FileStore do

	include FakeFS::SpecHelpers

	context "finding stub file" do

		before do
	  	@fs = Stubhub::FileStore.new(".")
		end

		it "returns an empty stubbed response if no matching stub file found" do
	  	response = @fs.file_for_uri("test")
	  	expect(response).to be_empty
		end

	  context "path with one segment" do

	  	before do
	  		@uri = "/test"
	    end

	    it "returns the stubbed response of the stub file where the file name matches the path" do
				File.write("test", "hello world")
		  	fs = Stubhub::FileStore.new(".")
		  	response = fs.file_for_uri(@uri)
		  	expect(response.contents).to eq("hello world")
	    end

	  end

	  context "path with more than one segment" do

	  	before do
	  		@uri = "/path/to/resource"
	    end

	    it "returns the stubbed response of the stub file where the file name matches the path where / are replaced by -" do
				File.write("path-to-resource", "hello world")
		  	fs = Stubhub::FileStore.new(".")
		  	response = fs.file_for_uri(@uri)
		  	expect(response.contents).to eq("hello world")
	    end
	  end

	end

	context "seed directory" do

		before do
			File.write("test", "hello world")
		end

		it "can set the seed directory with a relative path" do
	  	fs = Stubhub::FileStore.new(".")
	  	response = fs.file_for_uri("test")
	  	expect(response.contents).to eq("hello world")
		end

		it "can set the seed directory with an absolute path" do
			fs = Stubhub::FileStore.new(Dir.getwd)
	  	response = fs.file_for_uri("test")
	  	expect(response.contents).to eq("hello world")
		end

	end

end
