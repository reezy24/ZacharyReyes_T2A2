class ProjectsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show

  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.project_roles.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.owner = current_member
    @project.image.attach(project_params[:image])
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      strong_params = params.require(:project).permit(
        :title, :description, :duration, :budget, :image,
        project_roles_attributes: [:expertise, :description],
      )
      # replace the expertise id with the acutal object
      strong_params[:project_roles_attributes].each do |k, attributes|
        attributes[:expertise] = Expertise.find(attributes[:expertise])
      end;
      p "params: ", strong_params
      return strong_params
    end
end
