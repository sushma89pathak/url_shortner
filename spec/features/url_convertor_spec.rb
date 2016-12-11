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
  end

  describe 'search' do
    it 'has a search form that can be reached successfully' do
      visit search_url_path
      expect(page.status_code).to eq(200)
      expect(page).to have_content("Enter URL to visit:")
    end

  end
end
