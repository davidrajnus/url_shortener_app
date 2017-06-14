require 'rails_helper'
require 'byebug'

RSpec.describe "Urls", type: :request do
  describe "GET /urls" do
    it "displays short url" do
      Url.create!(:long_url => "www.google.com")
      visit urls_path
      #following is for response without capybara
      # expect(response).to have_http_status(200)
      # response.body.should include("www.google.com")
      page.should have_content("www.google.com")
    end
  end

  describe "POST /urls" do
    it "create short url" do
    #   OLD METHOD WITHOUT AJAX  
    #   post_via_redirect urls_path, :url => {:long_url => "www.ruby.com"}
    #   Url.create!(:long_url => "www.google.com")
    #   url = Url.last.short_url
    #   # response.body.should include("#{url}")
    #   page.should have_content("www.google.com")
    # end

    #  New Method to check AJAX function
    # to check the page in byebug, use page.body
    visit new_url_path
    fill_in("url_long_url", with: 'www.google.com')
    click_button("Shorten URL!")
    page.should have_content("#{Url.last.short_url}")
    end
  end
end
