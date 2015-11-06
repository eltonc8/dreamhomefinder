class Feature < ActiveRecord::Base
  validates_inclusion_of :lat, in: -90..90
  validates_inclusion_of :lng, in: -180..180
  validates :lat, :lng, numericality: true
  validates :bedrooms, :bathrooms, :price, :sq_ft,
  numericality: { only_integer: true }
  validates :identity, :status, :street, presence: true

  def self.listings(params)
    queries = search_queries(params)

    if queries
      where( queries )
    else
      all
    end
  end

  def self.listings_with_pagination(params)
    queries = search_queries(params)

    params[:page] = (params[:page].to_i - 1) || 0
    params[:size] = params[:size].to_i || 10
    offset = params[:size] * params[:page]

    if queries
      order(:id).offset( offset ).where( queries ).limit( params[:size] )
    else
      order(:id).offset( offset ).limit( params[:size] )
    end
  end

  def coordinates
    [lng, lat]
  end

  private
  def self.search_queries(ops)
    # allowing these searches:
    #  min_price, max_price
    #  min_bed, max_bed
    #  min_bath, max_bath
    # /listings?min_price=100000&max_price=200000&min_bed=2&max_bed=2&min_bath=2&max_bath=2
    queries = []

    queries << arel_table[:price].gteq( ops[:min_price] ) if ops[:min_price]
    queries << arel_table[:price].lteq( ops[:max_price] ) if ops[:max_price]
    queries << arel_table[:bedrooms].gteq( ops[:min_bed] ) if ops[:min_bed]
    queries << arel_table[:bedrooms].lteq( ops[:max_bed] ) if ops[:max_bed]
    queries << arel_table[:bathrooms].gteq( ops[:min_bath] ) if ops[:min_bath]
    queries << arel_table[:bathrooms].lteq( ops[:max_bath] ) if ops[:max_bath]

    queries.inject {|first, second| first.and(second)}
  end
end
