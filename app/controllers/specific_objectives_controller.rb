class SpecificObjectivesController < ApplicationController
  before_action :set_specific_objective, only: [:show, :edit, :update, :destroy]

  # GET /specific_objectives
  # GET /specific_objectives.json
  def index
    @specific_objectives = SpecificObjective.all
  end

  # GET /specific_objectives/1
  # GET /specific_objectives/1.json
  def show
  end

  # GET /specific_objectives/new
  def new
    @specific_objective = SpecificObjective.new
  end

  # GET /specific_objectives/1/edit
  def edit
  end

  # POST /specific_objectives
  # POST /specific_objectives.json
  def create
    @specific_objective = SpecificObjective.new(specific_objective_params)

    respond_to do |format|
      if @specific_objective.save
        format.html { redirect_to @specific_objective, notice: 'Specific objective was successfully created.' }
        format.json { render :show, status: :created, location: @specific_objective }
      else
        format.html { render :new }
        format.json { render json: @specific_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_objectives/1
  # PATCH/PUT /specific_objectives/1.json
  def update
    respond_to do |format|
      if @specific_objective.update(specific_objective_params)
        format.html { redirect_to @specific_objective, notice: 'Specific objective was successfully updated.' }
        format.json { render :show, status: :ok, location: @specific_objective }
      else
        format.html { render :edit }
        format.json { render json: @specific_objective.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_objectives/1
  # DELETE /specific_objectives/1.json
  def destroy
    @specific_objective.destroy
    respond_to do |format|
      format.html { redirect_to specific_objectives_url, notice: 'Specific objective was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_objective
      @specific_objective = SpecificObjective.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specific_objective_params
      params.require(:specific_objective).permit(:name, :comments)
    end
end
