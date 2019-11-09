class WelcomeController < ApplicationController
  def index
    if current_member and not current_member.profile_complete? then
      redirect_to my_dashboard_profile_path
    end
  end
end
