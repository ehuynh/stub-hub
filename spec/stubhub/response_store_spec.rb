require 'spec_helper'

require 'stub-hub/response_store'
require 'fakefs/spec_helpers'

describe Stubhub::ResponseStore do

  include FakeFS::SpecHelpers

  context "finding stub file" do

    before do
      @uri = "/foo/bar"
    end

    it "returns an empty stubbed response if no matching entry defined in stubhub.yml" do
      File.write("stubhub.yml", {"responses" => {}}.to_yaml)
      @fs = Stubhub::ResponseStore.new(".")

      response = @fs.response_for_uri(@uri)
      expect(response).to be_empty
    end

    it "returns the stubbed response of the stub file defined in stubhub.yml" do
      contents = "hello world"
      file_path = "test.json"
      File.write("stubhub.yml", {"responses" => {@uri => {"path" => file_path}}}.to_yaml)
      File.write(file_path, contents)
      fs = Stubhub::ResponseStore.new(".")
      
      response = fs.response_for_uri(@uri)
      expect(response.contents).to eq(contents)
    end

  end

  context "seed directory" do

    before do
      @uri = "/foo/bar"
      @contents = "hello world"
      @file_path = "test.json"
      File.write("stubhub.yml", {"responses" => {@uri => {"path" => @file_path}}}.to_yaml)
      File.write(@file_path, @contents)
    end

    it "can set the seed directory with a relative path" do
      fs = Stubhub::ResponseStore.new(".")

      response = fs.response_for_uri(@uri)
      expect(response.contents).to eq(@contents)
    end

    it "can set the seed directory with an absolute path" do
      fs = Stubhub::ResponseStore.new(Dir.getwd)

      response = fs.response_for_uri(@uri)
      expect(response.contents).to eq(@contents)
    end

  end

end
