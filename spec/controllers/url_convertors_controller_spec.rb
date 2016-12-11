require 'rails_helper'

RSpec.describe UrlConvertorsController, type: :controller do

  before do
    @url = FactoryGirl.create(:urlconvertor)
  end

  it "sanitizes the original_url" do
    expect(controller.sanitize_url("test.123.com")).to eq("http://test.123.com")
  end

  it "navigates to original URL" do
    post :visit_original_url, params: { short_url: "8Abc32"  }
    expect(response).to redirect_to("http://test.hosttest.123.com")
  end

end
