require_relative '../support/spec_helper'

describe 'Moolah: Negative Login' do

  # This is an example of overriding the default value of user's password
  # from the dedric.yml file. You can also supplement data with this syntax.
  let(:user)  { Huzzah::Role.new(:dedric, password: 'password') }

  before(:each) do
    user.moolah.visit
  end

  after(:each) do
    user.browser.close
  end

  # This example uses the site config YAML file to store the expected error message.
  it 'displays error message on invalid login attempt' do
    user.moolah.login_page.login
    expect(user.moolah.login_page.message.when_present.text).to eql(user.moolah.config[:login_error_message])
  end

end