class Inventory < ActiveRecord::Base
  has_one :caroption, foreign_key: "VIN"
end