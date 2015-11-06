class Feature < ActiveRecord::Base
  validates_inclusion_of :lat, in: -90..90
  validates_inclusion_of :lng, in: -180..180
  validates :lat, :lng, numericality: true
  validates :bedrooms, :bathrooms, :price, :sq_ft,
  numericality: { only_integer: true }
  validates :identity, :status, :street, presence: true

  def self.listings(ops)
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

    if queries.first
      where( queries.inject {|first, second| first.and(second)} )
    else
      all
    end
  end

  def coordinates
    [lng, lat]
  end
end
