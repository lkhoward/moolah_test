module Moolah
  class AccountActivity < Huzzah::Page

    locator(:activities)  { divs(class: 'activity') }

    def most_recent_transaction
      activities.last.text
    end

  end
end