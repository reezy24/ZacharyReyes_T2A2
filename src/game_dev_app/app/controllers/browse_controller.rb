class BrowseController < ApplicationController
  before_action :authenticate_member!
  def browse
    @params = browse_params
    @results = []
    if @params[:group] == "Work" then
      # return projects with project roles that match the expertise
      # search criteria
      @results = ProjectRole.where(expertise_id: @params[:project_expertise])
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
