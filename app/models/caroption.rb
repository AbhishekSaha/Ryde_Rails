class Caroption < ActiveRecord::Base
  belongs_to :inventory, foreign_key: "VIN"
end
