module Moolah
  class LoginPage < Huzzah::Page

    locator(:email_field)     { text_field(name: 'email') }
    locator(:password_field)  { text_field(name: 'password') }
    locator(:login_button)    { button(value: 'Login') }
    locator(:sign_up)         { link(text: 'Sign Up') }
    locator(:message)         { div(class: 'flash error') }

    def login
      email_field.set(@role_data[:email])
      password_field.set(@role_data[:password])
      login_button.click
    end

  end
end