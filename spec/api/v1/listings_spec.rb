require 'rails_helper'

feature "v1/listings" do
  context "displays all listings" do
    it "can visit page" do
      visit "/api/v1/listings"

      expect(page.status_code).to eq 200
    end

    context "specifications by sample.json" do
      it "has first level descriptions" do
        visit "/api/v1/listings"

        json = JSON.parse(body)
        expect(json["type"]).to eq 'FeatureCollection'
        expect(json["features"]).to be_a Array
      end

      it "has second level descriptions, if exists" do
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
