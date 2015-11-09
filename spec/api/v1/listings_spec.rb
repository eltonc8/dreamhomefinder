require 'rails_helper'

feature "v1/listings" do
  context "displays all listings" do
    it "can visit page" do
      visit "/api/v1/listings"

      expect(page.status_code).to eq 200
    end

    context "specifications by sample.json" do
      it "has first level descriptions - FeatureCollection" do
        visit "/api/v1/listings"

        json = JSON.parse(body)
        expect(json["type"]).to eq 'FeatureCollection'
        expect(json["features"]).to be_a Array
      end

      it "has second level descriptions - Features, if exists" do
        visit "/api/v1/listings"

        json = JSON.parse(body)
        feature_array = json["features"]

        if feature_array[0]
          first_feature = feature_array[0]
          expect(first_feature).to be_a Hash
          expect(first_feature["type"]).to eq "Feature"
          expect(first_feature["geometry"]).to be_a Hash
          expect(first_feature["properties"]).to be_a Hash
        end
      end

      it "has tertiary level descriptions - Features:gemoetry, if exists" do
        visit "/api/v1/listings"

        json = JSON.parse(body)
        feature_array = json["features"]

        if feature_array[0]
          feature_geometry = feature_array[0]["geometry"]
          expect(feature_geometry).to be_a Hash
          expect(feature_geometry["type"]).to eq("Point")
          expect(feature_geometry["coordinates"]).to be_a Array
          expect(feature_geometry["coordinates"]).to contain_exactly(Numeric, Numeric)
        end
      end

      it "has tertiary level descriptions - Features:properties, if exists" do
        visit "/api/v1/listings"

        json = JSON.parse(body)
        feature_array = json["features"]

        if feature_array[0]
          feature_geometry = feature_array[0]["properties"]
          expect(feature_geometry).to be_a Hash
          expect(feature_geometry["id"]).to be_a String
          expect(feature_geometry["price"]).to be_a Numeric
          expect(feature_geometry["street"]).to be_a String
          expect(feature_geometry["bedrooms"]).to be_a Numeric
          expect(feature_geometry["bathrooms"]).to be_a Numeric
          expect(feature_geometry["sq_ft"]).to be_a Numeric
        end
      end
    end

    it "has contents of the first feature" do
      visit "/api/v1/listings"
      feature = Feature.first

      expect(page).to have_content feature.street
      expect(page).to have_content feature.lat
      expect(page).to have_content feature.lng
    end

    it "has contents of the last feature" do
      visit "/api/v1/listings"
      feature = Feature.last

      expect(page).to have_content feature.street
      expect(page).to have_content feature.lat
      expect(page).to have_content feature.lng
    end
  end
end
