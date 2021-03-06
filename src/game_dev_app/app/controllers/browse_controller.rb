class BrowseController < ApplicationController
  before_action :authenticate_member!
  def browse
    @params = browse_params
    @results = []
    if @params[:group] == "Work" then
      # return project roles that match the expertise
      # search criteria
      ProjectRole.where(expertise_id: @params[:project_expertise]).each do |role|
        @results << role if not role.member_id
      end
    else
      # return members with areas of expertise that match the expertise
      # search criteria
      @results = MemberExpertise.where(expertise_id: @params[:project_expertise])
    end
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def browse_params
      params.permit(:group, :project_expertise)
    end
end
