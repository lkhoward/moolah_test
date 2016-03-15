module Moolah
  class SignUpPage < Huzzah::Page

    locator(:email_field)     { text_field(name: 'email') }
    locator(:name_field)      { text_field(name: 'name') }
    locator(:phone_field)     { text_field(name: 'phone') }
    locator(:password_field)  { text_field(name: 'password') }
    locator(:submit_button)   { button(value: 'Submit') }

  end
end