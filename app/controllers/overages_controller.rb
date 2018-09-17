class OveragesController < ApplicationController
  before_action :set_overage, only: [:show, :edit, :update, :destroy]

  # GET /overages
  # GET /overages.json
  def index
    @overages = Overage.all
  end

  # GET /overages/1
  # GET /overages/1.json
  def show
  end

  # GET /overages/new
  def new
    @overage = Overage.new
  end

  # GET /overages/1/edit
  def edit
  end

  # POST /overages
  # POST /overages.json
  def create
    @overage = Overage.new(overage_params)

    respond_to do |format|
      if @overage.save
        format.html { redirect_to @overage, notice: 'Overage was successfully created.' }
        format.json { render :show, status: :created, location: @overage }
      else
        format.html { render :new }
        format.json { render json: @overage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /overages/1
  # PATCH/PUT /overages/1.json
  def update
    respond_to do |format|
      if @overage.update(overage_params)
        format.html { redirect_to @overage, notice: 'Overage was successfully updated.' }
        format.json { render :show, status: :ok, location: @overage }
      else
        format.html { render :edit }
        format.json { render json: @overage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /overages/1
  # DELETE /overages/1.json
  def destroy
    @overage.destroy
    respond_to do |format|
      format.html { redirect_to overages_url, notice: 'Overage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overage
      @overage = Overage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overage_params
      params.require(:overage).permit(:name, :number, :overage_date, :reason, :added_data)
    end
end
