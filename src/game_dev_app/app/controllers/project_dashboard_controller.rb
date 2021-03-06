class ProjectDashboardController < ApplicationController
  before_action :authenticate_member!
  before_action :set_proj
  def edit
  end

  def members
  end

  def requests
    # outbound - offers where sender and project owner is current user
    @outbound_requests = []
    Offer.where(sender: current_member, response: nil).each do |pend|
      @outbound_requests << pend if pend.project_role.project == @project
    end
    # inbound - offers where receiver is current member and project is this project
    @inbound_requests = []
    Offer.where(receiver: current_member, response: nil).each do |pend|
      @inbound_requests << pend if pend.project_role.project == @project
    end
  end

  private
  def proj_params
    params.permit(:id)
  end
  def set_proj
    # get project using passed id
    @project = Project.find(proj_params[:id])
  end
end
