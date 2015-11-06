class Feature < ActiveRecord::Base
  validates_inclusion_of :lat, in: -90..90
  validates_inclusion_of :lng, in: -180..180
  validates :lat, :lng, numericality: true
  validates :bedrooms, :bathrooms, :price, :sq_ft,
            numericality: { only_integer: true }
  validates :identity, :status, :street, presence: true
end
