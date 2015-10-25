class Api::V1::DriversController < Api::ApiController

  def index
    puts params
    @results = $geohash.search_bouding_box(params["sw"].split(","), params["ne"].split(","), 1, 500)
    respond_with @results
  end

  def show
    @driver = Driver.find params[:id]
    respond_with @driver
  end

  def create
    driver = Driver.create(driver_params)
    render nothing: true, status: (driver.persisted? ? 202 : 422)
  end

  def status
    @driver = Driver.find params[:id]
    @driver.update_location(location_params)
    render nothing: true, status: (@driver.valid? ? 202 : 422)
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :plate)
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :available)
  end

end
