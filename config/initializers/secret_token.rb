# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Brainwo::Application.config.secret_key_base = ENV['SECRET_TOKEN'] || '063a64c8f04448cc20c7be3844b90ae76526d045315fb9f00b9b88d1cb20cb9a86992b06cdba31e7a3d0d68ef8506d87c2bf1260152f5b2bbd0266f5de7eaea8'
