require 'spec_helper'

describe "User pages" do

  subject {page }

  describe "signup page" do

    before {visit signup_path}
    it {should have_content('Sign Up')}
    it { should have_title(full_title('Sign Up'))}

  end

  describe "profile page" do 
  	let(:user) { FactoryGirl.create(:user)}
  	before { visit user_path(user)}
  	it { should have_content(user.name)}
  	it { should have_title(user.name)}
  end 

  #testing for user signing up 
  describe "signup" do 
  	before { visit signup_path }
  	let(:submit) { "Create my account"}

  	describe "with invalid information" do 
  		it "should not create user" do 
  			expect { click_button submit}.not_to change(User, :count)
  		end
  	end

  	describe "with valid user data " do 
  		before do
  			fill_in "Name", 		with: "Fred Saucedo"
  			fill_in "Email", 		with: "alfred3863@gmail.com"
  			fill_in "Password", 	with: "Fos386347"
  			fill_in "Confirmation",	with: "Fos386347" 
  		end

  		it "should create a user" do 
  			expect {click_button submit }.to change(User, :count).by(1)
  		end
  	end
  end
end
