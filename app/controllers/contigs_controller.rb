class ContigsController < ApplicationController
  before_action :set_contig, only: [:show, :edit, :update, :destroy]

  # GET /contigs
  # GET /contigs.json
  def index
    @contigs = Contig.all
  end

  # GET /contigs/1
  # GET /contigs/1.json
  def show
  end

  # GET /contigs/new
  def new
    @contig = Contig.new
  end

  # GET /contigs/1/edit
  def edit
  end

  # POST /contigs
  # POST /contigs.json
  def create
    @contig = Contig.new(contig_params)

    respond_to do |format|
      if @contig.save
        format.html { redirect_to @contig, notice: 'Contig was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contig }
      else
        format.html { render action: 'new' }
        format.json { render json: @contig.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contigs/1
  # PATCH/PUT /contigs/1.json
  def update
    respond_to do |format|
      if @contig.update(contig_params)
        format.html { redirect_to @contig, notice: 'Contig was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contig.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contigs/1
  # DELETE /contigs/1.json
  def destroy
    @contig.destroy
    respond_to do |format|
      format.html { redirect_to contigs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contig
      @contig = Contig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contig_params
      params.require(:contig).permit(:name, :length, :sequence)
    end
end
