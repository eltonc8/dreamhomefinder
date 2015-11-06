require 'rails_helper'

RSpec.describe "Feature", :type => :model do
  describe "model attributes" do
    attributes = [
      :lat,
      :lng,
      :price,
      :bedrooms,
      :bathrooms,
      :sq_ft,
      :status,
      :street,
      :identity
    ]

    attributes.each do |attr|
      it "has attribute: #{attr}" do
        event = Feature.new
        expect(event).to respond_to(attr)
      end
    end
  end

  describe "#coordinates" do
    it "correctly displays [lng,lat]" do
      feature = Feature.first

      expect(feature.coordinates).to be_a(Array)
      expect(feature.coordinates.first).to eq(feature.lng)
      expect(feature.coordinates.last).to eq(feature.lat)
    end
  end
end
