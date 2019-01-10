class OveragesController < ApplicationController
  before_action :set_overage, only: [:show, :edit, :update, :destroy]
  before_action :build_name_list, only: [:new, :edit]

  # GET /overages
  def index
    @overages = Overage.all
  end

  # GET /overages/1
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
  def create
    @overage = Overage.new(overage_params)

    respond_to do |format|
      if @overage.save
        format.html { redirect_to @overage, notice: 'Overage was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /overages/1
  def update
    respond_to do |format|
      if @overage.update(overage_params)
        format.html { redirect_to @overage, notice: 'Overage was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /overages/1
  def destroy
    @overage.destroy
    respond_to do |format|
      format.html { redirect_to overages_url, notice: 'Overage was successfully deleted.' }
    end
  end

  def import
    Phone.import(params[:file])
    redirect_to root_url, notice: "Phone list imported."
  end

  def summary
    @summaryhash = []
    current_data = 0
    current_count = 0
    overages = Overage.all
    @count = overages.count
    @data = 0
    data = 0
    if overages.length > 0
      # there are overages
      sorted_overages = overages.sort_by{ |s| s.name }
      current_name = sorted_overages.first.name
      sorted_overages.each do |s|
        if s.name != current_name
          @summaryhash.push({name: current_name, data: current_data.round(2), count: current_count})
          current_data = 0
          current_count = 0
        end
        data += s.added_data
        current_name = s.name
        current_data += s.added_data
        current_count += 1
      end
      @data = data.round(2)
      @summaryhash.push({name: current_name, data: current_data.round(2), count: current_count})
    end
  end

  def detail
    overages = Overage.where(name: params[:name])
    if overages.length > 0
      # there are overages
      @overages = overages.sort_by{ |s| s.overage_date }
      @data = 0
      data = 0
      @name = params[:name]
      @count = @overages.count
      @overages.each do |o|
        data += o.added_data
      end
      @data += data.round(2)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_overage
      @overage = Overage.find(params[:id])
    end

    def build_name_list
      @name = []
      @number = []
      @allname = []
      @allnumber = []
      @name_single = []
      tempname = []
      tempnumber = []
      phone = Phone.all
      phone.each do |c|
        if c.user_name && !tempname.include?(c.user_name)
          tempname.push(c.user_name)
        end
        if c.wireless_number && !tempnumber.include?(c.wireless_number)
          tempnumber.push(c.wireless_number)
        end
        if c.user_name != 'NOT IN USE, NOT IN USE'
          @allname.push(c.user_name.gsub(', ', '*'))
          @allnumber.push(c.wireless_number)
        end
      end

      @number = tempnumber.sort
      @name_single = tempname.sort
      @selected_name = 0
      i = 1
      @name_single.each do |c|
        select_item = []
        select_item.push(c)
        select_item.push(i)
        @name.push(select_item)
        i += 1
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def overage_params
      params.require(:overage).permit(:name, :phone_number, :overage_date, :reason, :added_data)
    end
end
