class InventoryController < ApplicationController

  layout 'application'

  def client
    @inventorys = Inventory.all
    if params['commit'].present?
      puts("Got this far")

      query = "Select i.* from INVENTORY i, options o"

      inventory = {}
      inventory[:make] = params['make']
      inventory[:type] = params['type']


      caropts = {}
      caropts[:LEATHER] = "Yes" unless params['leather'].blank?
      caropts[:FWD] = "Yes" unless params['fourwheeldrive'].blank?
      caropts[:FOGLIGHTS] = "Yes" unless params['foglights'].blank?
      caropts[:SURROUND] = "Yes" unless params['surround'].blank?
      caropts[:DVD] = "Yes" unless params['dvd'].blank?

      @VINS = Inventory.all.where(:INVENTORY => inventory).select("VIN")
      puts("Crap")

      @inventorys = Inventory.joins("INNER JOIN caroptions ON inventories.VIN = caroptions.VIN")
                        .where(:inventories => inventory, :caroptions => caropts)
    end

  end


end