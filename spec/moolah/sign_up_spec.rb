require_relative '../support/spec_helper'

describe 'Moolah: Sign Up' do

  let(:user)  { Huzzah::Role.new(:bryce) }

  before(:each) do
    user.moolah.visit
  end

  after(:each) do
    user.browser.close
  end

  # This is an example of passing a block to a page. In most cases,
  # you should probably just create a method on the page and call it.
  # Compare this with login_spec.rb.
  #
  # You can also pass a block to a site as well.
  # Example: user.moolah do
  #            some_actions
  #          end
  it 'allows a user to sign up' do
    user.moolah.login_page.sign_up.click
    user.moolah.sign_up_page do
      email_field.set(@role_data[:email])
      name_field.set(@role_data[:name])
      phone_field.set(@role_data[:phone])
      password_field.set(@role_data[:password])
      submit_button.click
    end
    expect(user.browser.title).to eql('Login | Moolah')
  end

end
