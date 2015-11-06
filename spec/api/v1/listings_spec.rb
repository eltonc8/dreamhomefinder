require 'rails_helper'

feature "v1/listings" do
  context "displays all listings" do
    it "can visit page" do
      visit "/api/v1/listings"

      expect(page.status_code).to eq 200
    end

    it "has contents as specified by sample.json" do
      visit "/api/v1/listings"

      json = JSON.parse(body)
      expect(json["type"]).to eq 'FeatureCollection'
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
