class Inventory < ActiveRecord::Base
  has_one :caroption, foreign_key: "VIN"
  belongs_to :seller, foreign_key: "SELLERID"
end