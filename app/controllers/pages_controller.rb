class PagesController < ApplicationController

  def landing
    if account_signed_in? == true
      redirect_to "/user_home"
    else
      render
    end
  end

  def user_home
    @tasks_person1 = current_account.tasks.where(:person1 => true)
    @tasks_person2 = current_account.tasks.where(:person2 => true)

    @events_person1 = current_account.events.where(:person1 => true)
    @events_person2 = current_account.events.where(:person2 => true)
  end

end
