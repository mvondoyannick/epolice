class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:destroy]
  add_breadcrumb "fichiers", :parametre_index_path
  layout 'views/index'

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.order(name: :asc).all
    #add_breadcrumb " ", grades_path
    add_breadcrumb "grades de police", :grades_path
  end

  # GET /grades/1
  # GET /grades/1.json
  def show
    add_breadcrumb "grade", grade_path
  end

  # GET /grades/new
  def new
    @grade = Grade.new
    add_breadcrumb "nouveau grade", new_grade_path
  end

  # GET /grades/1/edit
  def edit
    add_breadcrumb "edition", grade_path
  end

  # POST /grades
  # POST /grades.json
  def create
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path, notice: 'Grade was successfully created.' }
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1
  # PATCH/PUT /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1
  # DELETE /grades/1.json
  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grade_params
      params.require(:grade).permit(:name, :detail)
    end
end
