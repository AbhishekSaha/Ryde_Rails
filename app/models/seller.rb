class Seller < ActiveRecord::Base
  has_many :inventories, foreign_key: "SELLERID"
end