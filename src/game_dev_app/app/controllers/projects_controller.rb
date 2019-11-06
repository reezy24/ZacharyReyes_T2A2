class ProjectsController < ApplicationController
  before_action :authenticate_member!
  def new
    @project = Project.new
  end
end
