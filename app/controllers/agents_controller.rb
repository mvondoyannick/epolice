class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  add_breadcrumb "Fichiers", :parametre_index_path
  add_breadcrumb "gestion des agents", :agents_path
  layout 'fylo'
  # GET /agents
  # GET /agents.json
  def index
    respond_to do |format|
      format.html do
        @agents = Agent.order(name: :asc)
      end
      format.xls
    end
    add_breadcrumb 'agents', :agents_path
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    add_breadcrumb 'details', :agent_path
  end

  # GET /agents/new
  def new
    @agent = Agent.new
    add_breadcrumb 'nouvel agent', :new_agent_path
  end

  # GET /agents/1/edit
  def edit
    add_breadcrumb 'mise à jour agent', :agent_path
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        format.html { redirect_to agents_path: :index, notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to agents_path, notice: 'Agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_agent
    @agent.statusdeleted = true
    if @agent.save
      respond_to do |format|
        format.html do
          redirect_to agents_url, notice: 'Agent a été correctement supprimé.'
        end
        format.json { head :no_content}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:name, :prenom, :phone, :matricule, :grade_id, :avatar, :region_id, :groupement_id, :age, :sexe, :commissariat_id, :region_id, :avatar)
    end
end
