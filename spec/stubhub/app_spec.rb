require 'spec_helper'

require 'stubhub/app'
require 'fakefs/spec_helpers'
require "rack/test"

describe Stubhub::App do

	include FakeFS::SpecHelpers
  include Rack::Test::Methods

	def app
		Stubhub::App.new
	end

	it "returns not found if stubbed response does not exist" do
		get "/test"
		expect(last_response).to be_not_found
	end

	it "returns a successful stubbed response if one exists" do
		File.write("test", "hello world")
		get "/test"
		expect(last_response).to be_ok
		expect(last_response.body).to eq("hello world")
	end

end
