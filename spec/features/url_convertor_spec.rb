require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    it 'has a new form that can be reached successfully' do
      visit new_url_convertor_path
      expect(page.status_code).to eq(200)
    end
    #
    # it 'can be created from new form page', js: true do
    #   visit new_url_convertor_path
    #   fill_in 'url_convertor[original_url]', with: "facebook.com"
    #   click_on "Generate shorten URL"
    #   expect(page).to have_content("Generated short url is:")
    # end
  end

  describe 'search' do
    it 'has a search form that can be reached successfully' do
      visit search_url_path
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Enter URL to visit:")
    end

    it 'has a search form that can be reached successfully' do
      url = UrlConvertor.create(original_url: "www.facebook.com", short_url: "8Abc327")
      visit search_url_path
      fill_in 'short_url', with: "8Abc327"
      click_on "Navigate to the URL"
      expect(current_path).to eq("www:facebook.com")
      # current_path.should == "www://facebook.com"
      # expect(response.body).to eq('http://www.google.com')
      #  expect(current_path).to eq "www.facebook.com"
      # expect(response.body).to redirect_to("http://www.facebook.com")
    end

  end
end
