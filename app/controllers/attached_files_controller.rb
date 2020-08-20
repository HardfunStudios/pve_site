class AttachedFilesController < ApplicationController
  before_action :set_attached_file, only: [:show, :edit, :update, :destroy]

  # GET /attached_files
  # GET /attached_files.json
  def index
    @attached_files = AttachedFile.all
  end

  # GET /attached_files/1
  # GET /attached_files/1.json
  def show
  end

  # GET /attached_files/new
  def new
    @attached_file = AttachedFile.new
  end

  # GET /attached_files/1/edit
  def edit
  end

  # POST /attached_files
  # POST /attached_files.json
  def create
    @attached_file = AttachedFile.new(attached_file_params)

    respond_to do |format|
      if @attached_file.save
        format.html { redirect_to @attached_file, notice: 'Attached file was successfully created.' }
        format.json { render :show, status: :created, location: @attached_file }
      else
        format.html { render :new }
        format.json { render json: @attached_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attached_files/1
  # PATCH/PUT /attached_files/1.json
  def update
    respond_to do |format|
      if @attached_file.update(attached_file_params)
        format.html { redirect_to @attached_file, notice: 'Attached file was successfully updated.' }
        format.json { render :show, status: :ok, location: @attached_file }
      else
        format.html { render :edit }
        format.json { render json: @attached_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attached_files/1
  # DELETE /attached_files/1.json
  def destroy
    @attached_file.destroy
    respond_to do |format|
      format.html { redirect_to attached_files_url, notice: 'Attached file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attached_file
      @attached_file = AttachedFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attached_file_params
      params.require(:attached_file).permit(:origin_url, :local_url, :file_type)
    end
end
