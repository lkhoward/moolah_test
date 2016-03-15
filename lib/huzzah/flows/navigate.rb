class Navigate < Huzzah::Flow

  def to_account_activity
    moolah.login_page.login
    moolah.user_account.view_account_activity.click
  end

end