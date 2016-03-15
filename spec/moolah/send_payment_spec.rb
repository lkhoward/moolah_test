require_relative '../support/spec_helper'

describe 'Moolah: Send Payment' do

  # This is a example of scenario that involves two separate roles (or users)
  let(:dedric)  { Huzzah::Role.new(:dedric) }
  let(:carey)  { Huzzah::Role.new(:carey) }

  before(:each) do
    dedric.moolah.visit
    carey.moolah.visit
  end

  after(:each) do
    dedric.browser.close
    carey.browser.close
  end

  it 'allows a user to send a payment' do
    dedric.payment.send_to('carey.braun@okon.co', '5.00')
    carey.navigate.to_account_activity
    expect(carey.moolah.account_activity.most_recent_transaction).to include(dedric.role_data[:full_name].upcase)
  end

end