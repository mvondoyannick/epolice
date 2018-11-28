class PostCommissariatsController < ApplicationController
  before_action :set_post_commissariat, only: [:show, :edit, :update, :destroy]

  layout 'views/index'

  # GET /post_commissariats
  # GET /post_commissariats.json
  def index
    @post_commissariats = PostCommissariat.all
  end

  # GET /post_commissariats/1
  # GET /post_commissariats/1.json
  def show
  end

  # GET /post_commissariats/new
  def new
    @post_commissariat = PostCommissariat.new
  end

  # GET /post_commissariats/1/edit
  def edit
  end

  # POST /post_commissariats
  # POST /post_commissariats.json
  def create
    @post_commissariat = PostCommissariat.new(post_commissariat_params)

    respond_to do |format|
      if @post_commissariat.save
        format.html { redirect_to @post_commissariat, notice: 'Post commissariat was successfully created.' }
        format.json { render :show, status: :created, location: @post_commissariat }
      else
        format.html { render :new }
        format.json { render json: @post_commissariat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_commissariats/1
  # PATCH/PUT /post_commissariats/1.json
  def update
    respond_to do |format|
      if @post_commissariat.update(post_commissariat_params)
        format.html { redirect_to @post_commissariat, notice: 'Post commissariat was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_commissariat }
      else
        format.html { render :edit }
        format.json { render json: @post_commissariat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_commissariats/1
  # DELETE /post_commissariats/1.json
  def destroy
    @post_commissariat.destroy
    respond_to do |format|
      format.html { redirect_to post_commissariats_url, notice: 'Post commissariat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_commissariat
      @post_commissariat = PostCommissariat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_commissariat_params
      params.require(:post_commissariat).permit(:commissariat_id, :agent_id, :grade_id)
    end
end
