# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

require 'securerandom'
def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    #Use existing token
    File.read(token_file).chomp
  else
    #generate new token

    token =  SecureRandom.hex(64)
    File.write(token_file, token)

  end
end
SampleApp::Application.config.secret_key_base = 'c4a5454dd5b41156d6c9c59515027387578f34f58a1b8d9f60e77b1b65bafaa839b28d41c5030e33e79f4e25abb3575cf20437977449fd51b412620c713729f1'
