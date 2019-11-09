class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_receiver, only: [:new]
  before_action :set_project_role, only: [:new]

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    if not @project_role then
      # select all roles where project owner is current member
      @roles = []
      Project.all.each do |p|
        if p.owner == current_member then
          p.project_roles.each do |r|
            @roles << r
          end
        end
      end
    end
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = Offer.new
    @offer.sender = current_member
    @offer.receiver = Member.find(params[:receiver_id])
    @offer.project_role = ProjectRole.find(offer_params[:project_role])
    @offer.description = offer_params[:description]
    respond_to do |format|
      if @offer.save
        if @offer.project_role.project.owner == current_member then
          format.html { redirect_to project_dashboard_requests_path(@offer.project_role.project.id), notice: 'Offer was successfully created.' }
        else
          format.html { redirect_to my_dashboard_proposals_path, notice: 'Offer was successfully created.' }
        end
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end
    
    def set_receiver
      @receiver = Member.find(params[:receiver_id])
    end

    def set_project_role
      @project_role = nil
      if params[:project_role_id] then
        @project_role = ProjectRole.find(params[:project_role_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:receiver_id, :project_role, :description)
    end
end
