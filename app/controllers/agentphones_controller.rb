class AgentphonesController < ApplicationController
  before_action :set_agentphone, only: [:show, :edit, :update, :destroy]

  # GET /agentphones
  # GET /agentphones.json
  def index
    @agentphones = Agentphone.all
    render layout: 'admin'
  end

  # GET /agentphones/1
  # GET /agentphones/1.json
  def show
    render layout: 'admin'
  end

  # GET /agentphones/new
  def new
    @agentphone = Agentphone.new
    render layout: 'admin'
  end

  # GET /agentphones/1/edit
  def edit
    render layout: 'admin'
  end

  # POST /agentphones
  # POST /agentphones.json
  def create
    @agentphone = Agentphone.new(agentphone_params)

    respond_to do |format|
      if @agentphone.save
        format.html { redirect_to @agentphone, notice: 'Agentphone was successfully created.' }
        format.json { render :show, status: :created, location: @agentphone }
      else
        format.html { render :new }
        format.json { render json: @agentphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agentphones/1
  # PATCH/PUT /agentphones/1.json
  def update
    respond_to do |format|
      if @agentphone.update(agentphone_params)
        format.html { redirect_to @agentphone, notice: 'Agentphone was successfully updated.' }
        format.json { render :show, status: :ok, location: @agentphone }
      else
        format.html { render :edit }
        format.json { render json: @agentphone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agentphones/1
  # DELETE /agentphones/1.json
  def destroy
    @agentphone.destroy
    respond_to do |format|
      format.html { redirect_to agentphones_url, notice: 'Agentphone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agentphone
      @agentphone = Agentphone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agentphone_params
      params.require(:agentphone).permit(:phone, :fingerprint, :imei, :agent_id)
    end
end
