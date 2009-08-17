# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_storiesofhealth_session',
  :secret      => '28287f1f1990744fc9f0b343fb85c716701c2bf1183c55ea54d3f79edadf02fe421169856a6ad69759689a97bb5251ced9af3641c4356bc49c0bb3b1e5c4a3de'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
