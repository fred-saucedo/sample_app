require 'spec_helper'

describe "Static Pages" do
 describe "Home page" do
  it "should have the content 'Home'" do
    visit '/static_pages/home'
    expect(page).to have_content('Home')
  end

   it "should have the title 'Home'" do
     visit '/static_pages/home'
     expect(page).to have_title('BottleFly | Home')
   end
 end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('BottleFly | Help')
    end
  end

 #describes the about page,as the name states

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About'"do
      visit '/static_pages/about'
      expect(page).to have_title('BottleFly | About')
    end
  end
end
