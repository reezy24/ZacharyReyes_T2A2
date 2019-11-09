class ProjectDashboardController < ApplicationController
  before_action :set_proj
  def edit
  end

  def members
    @members = []
    @project.project_roles.where(member: true) do |role|
      p role
      @members << role.member
    end
  end

  def requests
  end

  private
  def proj_params
    params.permit(:id)
  end
  def set_proj
    @project = Project.find(proj_params[:id])
  end
end
