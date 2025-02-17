class BusinessRegulationsController < ApplicationController
  before_action :set_business_regulation, only: %i[ show edit update destroy ]

  # GET /business_regulations or /business_regulations.json
  def index
    @business_regulations = BusinessRegulation.all
  end

  # GET /business_regulations/1 or /business_regulations/1.json
  def show
  end

  # GET /business_regulations/new
  def new
    @business_regulation = BusinessRegulation.new
  end

  # GET /business_regulations/1/edit
  def edit
  end

  # POST /business_regulations or /business_regulations.json
  def create
    @business_regulation = BusinessRegulation.new(business_regulation_params)

    respond_to do |format|
      if @business_regulation.save
        format.html { redirect_to @business_regulation, notice: "Business regulation was successfully created." }
        format.json { render :show, status: :created, location: @business_regulation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @business_regulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /business_regulations/1 or /business_regulations/1.json
  def update
    respond_to do |format|
      if @business_regulation.update(business_regulation_params)
        format.html { redirect_to @business_regulation, notice: "Business regulation was successfully updated." }
        format.json { render :show, status: :ok, location: @business_regulation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @business_regulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_regulations/1 or /business_regulations/1.json
  def destroy
    @business_regulation.destroy!

    respond_to do |format|
      format.html { redirect_to business_regulations_path, status: :see_other, notice: "Business regulation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business_regulation
      @business_regulation = BusinessRegulation.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def business_regulation_params
      params.expect(business_regulation: [ :title, :subtitle, :page_num, images: [] ])
    end
end
