class Api::V1::DriversController < Api::ApiController

  api :GET, '/drivers', "Busca motoristas por lat e lng"
  param :sw, String, "latitude e longitude separado por virgula ex: -90,-180"
  param :ne, String, "latitude e longitude separado por virgula ex: -90,-180"
  def index
    @results = $geohash.search_bouding_box(params["sw"].split(",").map(&:to_i), params["ne"].split(",").map(&:to_i), 0, 500)
    respond_with convert_redis_geo(@results)
  end

  api :GET, '/drivers/:id', "Retorna informacoes relativa ao motorista"
  param :id, :number, "Id do motorista"
  def show
    @driver = Driver.find params[:id]
    respond_with @driver
  end

  api :POST, '/drivers', "Criar motorista"
  param :driver, Hash do
    param :name, String
    param :plate, String
  end
  error 422, "Dados incorretos"
  def create
    driver = Driver.create(driver_params)
    render nothing: true, status: (driver.persisted? ? 202 : 422)
  end

  api :PATCH, '/drivers/:id/status', "Atualiza posicao do motorista"
  param :id, :number
  param :location, Hash do
    param :latitude, Float
    param :longitude, Float
    param :available, [true, false], "Disponibilidade"
  end
  error 422, "Dados incorretos"
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

  def convert_redis_geo(result)
    points = []
    result.each do |key, fields|
      points << {"DriverId" => key, latitude: fields[0], longitude: fields[1], "driverAvailable" => true }
    end
    points
  end

end
