module Moolah
  class UserAccount < Huzzah::Page

    include_partial(Moolah::Header)

    locator(:welcome_message)  { span(class: 'welcome') }
    locator(:email_field)      { text_field(name: 'email') }
    locator(:amount_field)     { text_field(name: 'amount') }
    locator(:send_button)      { button(value: 'Send Payment') }
    locator(:sent_message)     { div(text: 'Payment Sent.') }
    locator(:view_account_activity)  { link(text: 'View Account Activity >>') }

    def send_payment(user, amount)
      email_field.when_present.set(user)
      amount_field.set(amount)
      send_button.click
    end

  end
end