# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_teacherseat_session',
  :secret      => 'af5f0a2ecfabe8ab0ab1e86a49ffbbc79f7dd6649dc34c023e793104cb9fea4ebf0ee56532940443446473bdffccb0b964c3661853c88b6268b79e842b4d7c31'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
