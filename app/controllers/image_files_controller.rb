class ImageFilesController < ApplicationController
  before_action :set_image_file, only: [:show, :edit, :update, :destroy]

  # GET /image_files
  # GET /image_files.json
  def index
    @image_files = ImageFile.all
  end

  # GET /image_files/1
  # GET /image_files/1.json
  def show
  end

  # GET /image_files/new
  def new
    @image_file = ImageFile.new
  end

  # GET /image_files/1/edit
  def edit
  end

  # POST /image_files
  # POST /image_files.json
  def create
    @image_file = ImageFile.new(image_file_params)

    respond_to do |format|
      if @image_file.save
        format.html { redirect_to @image_file, notice: 'Image file was successfully created.' }
        format.json { render :show, status: :created, location: @image_file }
      else
        format.html { render :new }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_files/1
  # PATCH/PUT /image_files/1.json
  def update
    respond_to do |format|
      if @image_file.update(image_file_params)
        format.html { redirect_to @image_file, notice: 'Image file was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_file }
      else
        format.html { render :edit }
        format.json { render json: @image_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_files/1
  # DELETE /image_files/1.json
  def destroy
    @image_file.destroy
    respond_to do |format|
      format.html { redirect_to image_files_url, notice: 'Image file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_file
      @image_file = ImageFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_file_params
      params.require(:image_file).permit(:origin_url, :local_url)
    end
end
