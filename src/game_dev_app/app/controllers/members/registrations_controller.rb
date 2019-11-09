# frozen_string_literal: true

class Members::RegistrationsController < Devise::RegistrationsController
  
  def update
    current_member.update(account_update_params)
    redirect_to my_dashboard_profile_path
  end

  protected

  def account_update_params
    strong_params = params.require(:member).permit(
      :first_name, :last_name, :about_me,
      member_expertises_attributes: [:expertise, :description],
    )
    # replace the expertise id with the acutal object
    strong_params[:member_expertises_attributes].each do |k, attributes|
      attributes[:expertise] = Expertise.find(attributes[:expertise])
    end;
    return strong_params
  end

end
