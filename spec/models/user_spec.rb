require 'spec_helper'

describe User do
  before { @user = User.new(name: "Fred Saucedo", email: "alfred3863@gmail.com", 
  						   password: "foobar", password_confirmation: "foobar")}
  subject { @user }

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  #adding a respond to password method
  it {should respond_to(:password_digest)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:authenticate)}

  it { should be_valid }

  #describes when name is not present
  describe "when name is not present" do
    before { @user.name =""}
    it {should_not be_valid}
  end

  #describes when a username is too long
  describe "when name is too  long" do 
  	before { @user.name = "a" * 51 }
  	it {should_not be_valid}
  end


  #describes when user did not enter an email
  describe "when email is not present" do
    before {@user.email = ""}
    it {should_not be_valid }
  end

  #describes when email format is valid
  describe "when email format it valid" do
  	it "should be invalid" do 
  		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
  		addresses.each do |invalid_address| 
  			@user.email = invalid_address
  			expect(@user).not_to be_valid
  		end
  	end 
  end

  describe "when email format is valid" do 
  	it "should be valid" do 
  		addresses = %w[user@foo.COM A_US-ER@f.b.org first.lst@foo.jp a+@baz.con]

  		addresses.each do |valid_address|
  			@user.email = valid_address
  		end
  	end
  end 

  #setting up testing to email uniqueness 
  describe "when email address is already taken" do 
  	before do  
  	#creating a duplicate user profile
  	user_with_same_email = @user.dup
  	user_with_same_email.email = @user.email.upcase
  	user_with_same_email.save
  	end

  	it {should_not be_valid }
  end 

  #password validation test

  describe "when password is not present" do 
  before {@user = User.new(name: "fred", email:"fred-sauced@me.com", 
  			password: " ", password_confirmation: " ")}

  it {should_not be_valid }
  end 

  #password_confirmation is match confirmatio
  describe "when password doesn't match confirmation" do 
  before {@user.password_confirmation ="mismatch"}
  it {should_not be_valid}
  end 

   describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
end