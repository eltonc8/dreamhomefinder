class Api::V2::FeaturesController < ApplicationController
  def listings
    begin
      @features = Feature.listings(params)
      render "features/listings.json"
    rescue
      render json: ["error with request"], status: :bad_request
    end
  end
end
