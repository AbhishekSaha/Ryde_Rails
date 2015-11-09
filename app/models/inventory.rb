class Inventory
  def initialize( vin, make, model, type, year, color, used, miles, kBBValue, rentalPrice, mPG, sellerID)
    @VIN = vin.to_s
    @make = make.to_s
    @model = model.to_s
    @type = type.to_s
    @year = year.to_i
    @color = color.to_s
    @used = used.to_s
    @miles = miles.to_i
    @KBBValue = kBBValue.to_i
    @rentalPrice = rentalPrice.to_i
    @MPG = mPG.to_i
    @SellerID = sellerID.to_s
  end
end