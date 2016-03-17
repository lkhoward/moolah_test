# Instantiate a role for user 'bryce'. The symbol :bryce is used to load
# the role's data file found at roles/bryce.yml
# The Role is the only class that you have to instantiate. Huzzah handles
# everything else for you.
Given(/^I am a new user$/) do
  @user = Huzzah::Role.new(:bryce)
  @user.moolah.visit
end

# This is an example of passing a block to a page. In most cases,
# you should probably just create a method on the page and call it.
# Compare this with login_spec.rb.
#
# You can also pass a block to a site as well.
# Example: user.moolah do
#            some_actions
#          end
#
# Also, this step def uses the Role data to fill out the form. No
# need to pass data from the scenario.
When(/^I sign up for an account$/) do
  @user.moolah.login_page.sign_up.click
  @user.moolah.sign_up_page do
    email_field.set(@role_data[:email])
    name_field.set(@role_data[:name])
    phone_field.set(@role_data[:phone])
    password_field.set(@role_data[:password])
    submit_button.click
  end
end

Then(/^I expect to be redirected to the login page$/) do
  expect(@user.browser.title).to eql('Login | Moolah')
end

Given(/^I am Carey$/) do
  @carey = Huzzah::Role.new(:carey)
  @carey.moolah.visit
end

When(/^I receive a payment of "([^"]*)" from Dedric$/) do |amount|
  @dedric = Huzzah::Role.new(:dedric)
  @dedric.moolah.visit
  @dedric.payment.send_to(@carey.role_data[:email], amount)
end

And(/^I view my Account Activity$/) do
  @carey.navigate.to_account_activity
end

Then(/^I expect to see the transaction$/) do
  expect(@carey.moolah.account_activity.most_recent_transaction).to include(@dedric.role_data[:full_name].upcase)
end

Given(/^I am "([^"]*)"$/) do |user|
  @user = Huzzah::Role.new(user)
end

# Example of passing a block to a Site.
# Also, the user's credentials are contained in the role_data,
# so there is no need to pass them to the page-object.
When(/^I login to Moolah$/) do
  @user.moolah do
    visit
    login_page.login
  end
end

# Use the Role data to maintain the expected result.
Then(/^I expect to see my User Account$/) do
  welcome_message = @user.moolah.user_account.welcome_message.when_present.text
  expect(welcome_message).to include(@user.role_data[:full_name])
end

# Use the Site config to maintain the expected error message.
Then(/^I expect to see the Login Error Message$/) do
  error_message = @user.moolah.login_page.message.when_present.text
  expect(error_message).to eql(@user.moolah.config[:login_error_message])
end

Given(/^I am logged into Moolah as "([^"]*)"$/) do |user|
  @user = Huzzah::Role.new(user)
  @user.moolah.visit
  @user.moolah.login_page.login
end

# Syntax for referencing a partial page-object.
When(/^I log out$/) do
  @user.moolah.user_account.header.logout.click
end

# You can reference the browser from the Role, Site,
# Page (or Partial) & Flow classes.
Then(/^I expect to see the Login Page$/) do
  expect(@user.browser.title).to eql('Login | Moolah')
end

# You can use the 'as' method to dynamically switch roles and execute a block of code
# within the context of the role. You can use the 'as' method with or without a block.
Given(/^"([^"]*)" has sent a payment of "([^"]*)" to "([^"]*)"$/) do |payer, amount, payee|
  @payee = as(payee.downcase)
  to_email = @payee.role_data[:email]
  @payer = as(payer.downcase) do
    moolah.visit
    payment.send_to(to_email, amount)
  end
end

When(/^the payee views his Account Activity$/) do
  @payee.moolah.visit
  @payee.navigate.to_account_activity
end

Then(/^he expects to see the transaction$/) do
  expect(@payee.moolah.account_activity.most_recent_transaction).to include(@payer.role_data[:full_name].upcase)
end