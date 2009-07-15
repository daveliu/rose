# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rose_session',
  :secret      => '3b2cdb8766ecb3ae4349e58826f082a0967a1efdcf3771cd0154c815dba7e4cfae46170bf65ed07bb62fcd1bb5f3f54ebc8c57140ad82846bcf2386355dfe833'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
