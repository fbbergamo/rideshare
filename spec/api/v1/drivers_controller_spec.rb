require 'rails_helper'

RSpec.describe Api::V1::DriversController, type: :api do
  let(:driver) { create(:driver) }

  it "should show dashboard default filter" do
    get  "/api/v1/drivers/#{driver.id}",{}.to_json, set_json
    result  = JSON.parse last_response.body
    expect(result["name"]).to be_eql(driver.name)
    expect(last_response.status).to be_eql(200)
  end

  it "should create driver" do
    post  "/api/v1/drivers",{driver: {name: "felipe", plate: "aaa123"} }.to_json, set_json
    expect(last_response.status).to be_eql(202)
  end

  it "should update driver status" do
    put  "/api/v1/drivers/#{driver.id}/status",{location: {available: true, latitude: -90, longitude: -180} }.to_json, set_json
    driver.reload
    expect(last_response.status).to be_eql(202)
    expect(driver.latitude).to be_eql(-90.0)
  end

  it "should update driver status" do
    driver.update_location({latitude: -90, longitude: -180, available: true})
    get  "/api/v1/drivers?sw=-90,-180&ne=90,180", {}, set_json
    puts last_response.body
  end

end
