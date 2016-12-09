require 'rails_helper'

RSpec.describe UrlConvertor, type: :model do
  describe "creation" do
  	before do
  		@url = UrlConvertor.create(original_url: "test.123.com", short_url: "8Abc32")
  	end

  	it "can be created" do
  		expect(@url).to be_valid
  	end

  	it "cannot be created without original_url" do
  		@url.original_url = nil
  		expect(@url).to_not be_valid
  	end

    it "original_url should be unique" do
      @url2 = UrlConvertor.create(original_url: "test.123.com")
  		expect(@url2).to_not be_valid
  	end
    
    it "short_url should be unique" do
      @url2 = UrlConvertor.create(original_url: "test1.123.com", short_url: "8Abc327")
  		expect(@url2).to be_valid
  	end

    it "short_url should be unique" do
      @url2 = UrlConvertor.create(original_url: "test1.123.com", short_url: "8Abc32")
  		expect(@url2).to_not be_valid
  	end


  end
end
