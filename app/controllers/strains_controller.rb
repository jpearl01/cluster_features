class StrainsController < ApplicationController
  before_action :set_strain, only: [:show, :edit, :update, :destroy]
  before_action :get_project, only: [:index, :new, :create, :import]

  # GET /strains
  # GET /strains.json
  def index
    @strains = @project.strains
  end

  # GET /strains/1
  # GET /strains/1.json
  def show
  end

  # GET /strains/new
  def new
    @strain = @project.strains.new
  end

  # GET /strains/1/edit
  def edit
  end

  # POST /strains
  # POST /strains.json
  def create
    @strain = @project.strains.new(strain_params)

    respond_to do |format|
      if @strain.save
        format.html { redirect_to @strain, notice: 'Strain was successfully created.' }
        format.json { render action: 'show', status: :created, location: @strain }
      else
        format.html { render action: 'new' }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strains/1
  # PATCH/PUT /strains/1.json
  def update
    respond_to do |format|
      if @strain.update(strain_params)
        format.html { redirect_to @strain, notice: 'Strain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @strain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strains/1
  # DELETE /strains/1.json
  def destroy
    @strain.destroy
    respond_to do |format|
      format.html { redirect_to project_strains_url(@strain.project_id) }
      format.json { head :no_content }
    end
  end

  def import
    @strain = @project.strains.new(strain_params)
    respond_to do |format|
      if @strain.import(params[:strain][:file])
        format.html { redirect_to @strain, notice: 'Strain was successfully imported.' }
      else
        format.json { render json: @strain.errors, status: :unprocessable_entity }        
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_strain
      @strain = Strain.find(params[:id])
    end
    
    def get_project
      @project = Project.find(params[:project_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def strain_params
      params.require(:strain).permit(:name, :length, :contig_num, :genus, :species, :project_id)
    end
end

