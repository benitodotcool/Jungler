class LandingPagesController < ApplicationController
  before_action :set_landing_page, only: %i[ show edit update destroy ]

  # GET /landing_pages or /landing_pages.json
  def index
    @landing_pages = LandingPage.all
  end

  # GET /landing_pages/1 or /landing_pages/1.json
  def show
  end

  # GET /landing_pages/new
  def new
    @landing_page = LandingPage.new
  end

  # GET /landing_pages/1/edit
  def edit
  end

  # POST /landing_pages or /landing_pages.json
  def create
    @landing_page = LandingPage.new(landing_page_params)

    respond_to do |format|
      if @landing_page.save
        format.html { redirect_to @landing_page, notice: "Landing page was successfully created." }
        format.json { render :show, status: :created, location: @landing_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /landing_pages/1 or /landing_pages/1.json
  def update
    respond_to do |format|
      if @landing_page.update(landing_page_params)
        format.html { redirect_to @landing_page, notice: "Landing page was successfully updated." }
        format.json { render :show, status: :ok, location: @landing_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @landing_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /landing_pages/1 or /landing_pages/1.json
  def destroy
    @landing_page.destroy
    respond_to do |format|
      format.html { redirect_to landing_pages_url, notice: "Landing page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing_page
      @landing_page = LandingPage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def landing_page_params
      params.fetch(:landing_page, {})
    end
end
