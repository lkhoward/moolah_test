class Payment < Huzzah::Flow

  def send_to(user, amount)
    moolah.login_page.login
    moolah.user_account.send_payment(user, amount)
  end

end