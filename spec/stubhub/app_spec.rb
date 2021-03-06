require 'spec_helper'

require 'stub-hub/app'
require 'fakefs/spec_helpers'
require "rack/test"

describe Stubhub::App do

  include FakeFS::SpecHelpers
  include Rack::Test::Methods

  def app
    Stubhub::App.new(".")
  end

  it "returns not found if stubbed response does not exist" do
    File.write("stubhub.yml", {"responses" => {}}.to_yaml)
    get "/test"
    expect(last_response).to be_not_found
  end

  it "returns a successful stubbed response if one exists" do
    File.write("stubhub.yml", {"responses" => {"/test" => {"path" => "test"}}}.to_yaml)
    File.write("test", "hello world")
    get "/test"
    expect(last_response).to be_ok
    expect(last_response.body).to eq("hello world")
  end

end
