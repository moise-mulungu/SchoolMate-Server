require 'firebase-admin-sdk'

module FirebaseAdmin
  def self.initialize
    # Parse the credentials JSON from the environment variable
    credentials_json = ENV['FIREBASE_SERVICE_ACCOUNT_KEY']

    # Load the credentials directly from the JSON string
    creds = Firebase::Admin::Credentials.from_json(credentials_json)

    # Initialize the Firebase Admin SDK
    @firebase_app = Firebase::Admin::App.new(credentials: creds)
  end

  def self.auth
    @firebase_app.auth
  end
end