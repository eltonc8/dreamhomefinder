class Api::V3::FeaturesController < ApplicationController
  def listings
    begin
      @features = Feature.listings_with_pagination(params)
      render "features/listings.json"
    rescue
      render json: ["error with request"], status: :bad_request
    end
  end
end
