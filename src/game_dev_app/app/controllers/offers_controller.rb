class OffersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :set_receiver, only: [:new]
  before_action :set_project_role, only: [:new]

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
            @roles << r if not r.member_id
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
    # find member with passed receiver id
    @offer.receiver = Member.find(offer_params[:offer][:receiver_id])
    # find ProjectRole with passed id
    @offer.project_role = ProjectRole.find(offer_params[:offer][:project_role])
    @offer.description = offer_params[:offer][:description]
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
      if @offer.update(offer_params[:offer])
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
    response = offer_params[:offer][:response] == "true"
    was_owned = @offer.project_role.project.owner == current_member
    # before destroying, set the project role to filled where applicable
    if response and was_owned then
      # this is an request, sender should fill the role
      @offer.project_role.update(member_id: @offer.sender.id)
    elsif response and not was_owned then
      # this is an offer, receiver should fill the role
      @offer.project_role.update(member_id: @offer.receiver.id)
    end
    @offer.destroy
    respond_to do |format|
      if was_owned and response then
        format.html { redirect_to project_dashboard_members_path(id: @offer.project_role.project.id), notice: 'You accepted the offer.' }
      elsif was_owned and not response then
        format.html { redirect_to project_dashboard_requests_path(id: @offer.project_role.project.id), notice: 'You declined the offer.' }
      elsif not was_owned and response then
        format.html { redirect_to my_dashboard_projects_path, notice: 'You accepted the offer.' }
      elsif not was_owned and not response then
        format.html { redirect_to my_dashboard_offers_path, notice: 'You declined the offer.' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      # find offer with passed id
      @offer = Offer.find(offer_params[:id])
    end
    
    def set_receiver
      # find member with passed id
      @receiver = Member.find(offer_params[:offer][:receiver_id])
    end

    def set_project_role
      # find project role with passed id
      @project_role = nil
      if offer_params[:offer][:project_role] then
        @project_role = ProjectRole.find(offer_params[:offer][:project_role])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.permit(:id, offer:[:receiver_id, :project_role, :description, :response])
    end
end
