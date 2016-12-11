require 'rails_helper'

RSpec.describe UrlConvertor, type: :model do
  context "creating urlConvertor" do
  	before do
  		@url = FactoryGirl.create(:urlconvertor)
  	end

  	it "can be created" do
  		expect(@url).to be_valid
  	end

  	it "cannot be created without original_url" do
  		@url.original_url = nil
  		expect(@url).to_not be_valid
  	end

    it "failed validation if original_url is not unique" do
      url2 = FactoryGirl.build(:urlconvertor4)
  		expect(url2).to_not be_valid
  	end

    it "failed validation if short_url is not unique" do
      url2 = FactoryGirl.build(:urlconvertor2)
  		expect(url2).to_not be_valid
  	end

    it "each unique original_url has unique short_url" do
      url2 = FactoryGirl.create(:urlconvertor3)
      expect(url2).to be_valid
    end

  end
end
