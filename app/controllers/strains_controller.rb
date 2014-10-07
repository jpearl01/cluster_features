class StrainsController < ApplicationController
  before_action :set_strain, only: [:show, :edit, :update, :destroy]

  # GET /strains
  # GET /strains.json
  def index
    @strains = Strain.all
  end

  # GET /strains/1
  # GET /strains/1.json
  def show
  end

  # GET /strains/new
  def new
    @strain = Strain.new
  end

  # GET /strains/1/edit
  def edit
  end

  # POST /strains
  # POST /strains.json
  def create
    @strain = Strain.new(strain_params)

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
      format.html { redirect_to strains_url }
      format.json { head :no_content }
    end
  end

  def import
    @strain = Strain.new(strain_params)
    respond_to do |format|
      if @strain.import(params[:strain][:file])
        format.html { redirect_to @strain, notice: 'Strain was successfully updated.' }
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def strain_params
      params.require(:strain).permit(:name, :length, :contig_num, :genus, :species)
    end
end

