class PagesController < ApplicationController

  def landing
    if account_signed_in? == true
      redirect_to "/user_home"
    else
      render
    end
  end

  def user_home
    today = Date.today
    tomorrow = Date.today.advance(days:1)

    if params[:range] == "today"
      @tasks_person1 = current_account.tasks.where(:person1 => true).where(:due_date => today).order("due_date")
      @tasks_person2 = current_account.tasks.where(:person2 => true).where(:due_date => today).order("due_date")
      @events_person1 = current_account.events.where(:person1 => true).where(:start_time => today.beginning_of_day..today.end_of_day).order("start_time")
      @events_person2 = current_account.events.where(:person2 => true).where(:start_time => today.beginning_of_day..today.end_of_day).order("start_time")
    elsif params[:range] == "tomorrow"
      @tasks_person1 = current_account.tasks.where(:person1 => true).where(:due_date => tomorrow).order("due_date")
      @tasks_person2 = current_account.tasks.where(:person2 => true).where(:due_date => tomorrow).order("due_date")
      @events_person1 = current_account.events.where(:person1 => true).where(:start_time => tomorrow.beginning_of_day..tomorrow.end_of_day).order("start_time")
      @events_person2 = current_account.events.where(:person2 => true).where(:start_time => tomorrow.beginning_of_day..tomorrow.end_of_day).order("start_time")
    elsif params[:range]
      advance = params[:range].to_i
      date_range = Date.today..Date.today.advance(days:advance)
      time_range = Date.today.beginning_of_day..Date.today.advance(days:advance).end_of_day
      @tasks_person1 = current_account.tasks.where(:person1 => true).where(:due_date => date_range).order("due_date")
      @tasks_person2 = current_account.tasks.where(:person2 => true).where(:due_date => date_range).order("due_date")
      @events_person1 = current_account.events.where(:person1 => true).where(:start_time => time_range).order("start_time")
      @events_person2 = current_account.events.where(:person2 => true).where(:start_time => time_range).order("start_time")
    else
      @tasks_person1 = current_account.tasks.where(:person1 => true).order("due_date")
      @tasks_person2 = current_account.tasks.where(:person2 => true).order("due_date")

      @events_person1 = current_account.events.where(:person1 => true).order("start_time")
      @events_person2 = current_account.events.where(:person2 => true).order("start_time")
    end
  end

end
