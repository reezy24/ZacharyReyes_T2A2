class MembersController < ApplicationController
  before_action :authenticate_member!
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_member
      @member = Member.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      strong_params = params.require(:member).permit(
        :first_name, :last_name, :about_me,
        member_expertises_attributes: [:expertise_id, :description],
      )
      # replace the expertise id with the acutal object
      strong_params[:member_expertises_attributes].each do |k, attributes|
        attributes[:expertise] = Expertise.find(attributes[:expertise])
      end;
      p "params: ", strong_params
      return strong_params
    end

end
