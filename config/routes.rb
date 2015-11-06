Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "listings", to: "features#listings"
    end

    namespace :v2 do
      get "listings", to: "features#listings"
    end

    namespace :v3 do
      get "listings", to: "features#listings"
    end
  end
end
