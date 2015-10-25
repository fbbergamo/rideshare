require 'rails_helper'

RSpec.describe Driver, type: :model do

  let(:driver) {  create(:driver) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:plate) }
  it {
    should validate_numericality_of(:latitude).
    is_greater_than_or_equal_to(-90).
    is_less_than_or_equal_to(90)
  }
  it {
    should validate_numericality_of(:longitude).
    is_greater_than_or_equal_to(-180).
    is_less_than_or_equal_to(180)
  }

  it "should update location and set on redis" do
    $geohash = double("geohash")
    allow($geohash).to receive(:add_point) { true }
    driver.update_location({latitude: -90, longitude: -180, available: true})
    expect(driver.valid?).to be_truthy
    expect(driver.latitude).to be_eql(-90.0)
    expect(driver.available).to be_truthy
  end

  it "should set available false and remove location on redis" do
    $geohash = double("geohash")
    allow($geohash).to receive(:has_point?) { true }
    expect($geohash).to receive(:remove_point).with(driver.id)
    driver.update_location({latitude: -90, longitude: -180, available: false})
    expect(driver.valid?).to be_truthy
    expect(driver.latitude).to be_eql(-90.0)
    expect(driver.available).to be_falsey
  end

  it "should set available false and avoid remove location" do
    $geohash = double("geohash")
    allow($geohash).to receive(:has_point?) { false }
    expect($geohash).to_not receive(:remove_point).with(driver.id)
    driver.update_location({latitude: -90, longitude: -180, available: false})
    expect(driver.valid?).to be_truthy
    expect(driver.latitude).to be_eql(-90.0)
    expect(driver.available).to be_falsey
  end
end
