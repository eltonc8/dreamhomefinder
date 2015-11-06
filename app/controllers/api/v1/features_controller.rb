class Api::V1::FeaturesController < ApplicationController
  def listings
    @features = Feature.all
    render "features/listings.json"
  end
end
