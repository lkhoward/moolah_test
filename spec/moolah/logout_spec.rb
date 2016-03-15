require_relative '../support/spec_helper'

describe 'Moolah: Logout' do

  let(:user)  { Huzzah::Role.new(:dedric) }

  before(:each) do
    user.moolah.visit
  end

  after(:each) do
    user.browser.close
  end

  it 'allows a user to logout' do
    user.moolah.login_page.login
    user.moolah.user_account.header.logout.click
    expect(user.browser.title).to eql('Login | Moolah')
  end

end