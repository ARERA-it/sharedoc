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

    # {"file"=>#<ActionDispatch::Http::UploadedFile:0x00007fc435f945d8 @tempfile=#<Tempfile:/var/folders/gy/9pc2wkcx7c9_jhnj764j4ch40000gn/T/RackMultipart20190115-26490-1jzt3ks.png>, @original_filename="A 1h da Pavia, 1h30 2h e 3h.png", @content_type="image/png", @headers="Content-Disposition: form-data; name=\"specific_objective[documents_attributes][1547561510128][file]\"; filename=\"A 1h da Pavia, 1h30 2h e 3h.png\"\r\nContent-Type: image/png\r\n">}}

    # site = Sharepoint::Site.new 'arera.sharepoint.com', 'sites/Test_Programmazione'
    # site.session.authenticate 'ibuetti@arera.it', 'Santiago2018'
    # puts "---> #{site.inspect}"
    # folder  = site.folder '/sites/Test_Programmazione/Documents'
    #
    # puts "----> #{params.inspect}"
    # uploaded_io = params[:file]
    # folder.add_file(uploaded_io.original_filename, uploaded_io.read)


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
      params.require(:specific_objective).permit(:name, :comments, documents_attributes: [ :file ])
    end
end
