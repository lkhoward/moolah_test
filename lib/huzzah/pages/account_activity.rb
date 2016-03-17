module Moolah
  class AccountActivity < Huzzah::Page

    locator(:activities)  { divs(class: 'activity') }

    def most_recent_transaction
      activities.last.when_present.text
    end

  end
end