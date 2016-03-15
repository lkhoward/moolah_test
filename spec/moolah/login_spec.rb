require_relative '../support/spec_helper'

describe 'Moolah: Login' do

  # This is an example of instantiating a defined role.
  # The data for the role is defined in roles/dedric.yml.
  let(:user)  { Huzzah::Role.new(:dedric) }

  before(:each) do
    user.moolah.visit # Load the url from sites/moolah.yml
  end

  after(:each) do
    user.browser.close
  end

  # This example uses the role's data to login to the app.
  # See pages/login_page.rb to see the implementation of the login method.
  # Also, the expectation pulls the user's full_name from the role_data hash.
  it 'allows a user to login' do
    user.moolah.login_page.login
    expect(user.moolah.user_account.welcome_message.when_present.text).to include(user.role_data[:full_name])
  end

end