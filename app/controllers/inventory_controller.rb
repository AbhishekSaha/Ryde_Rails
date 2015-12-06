class InventoryController < ApplicationController

  require 'json'
  layout 'application'

  def lookupVIN

    lops = Caroption.where("VIN = " + "'" + params['VIN']+ "'")

    rez = {"near" => JSON.parse(lops.to_json)}


    respond_to do |format|
      format.json { render json: rez } # respond with the created JSON object
    end
  end


  def clientoldie
    @inventorys = Inventory.order("DISTANCE")

    if params['commit'].present?

      inventory = {}
      inventory[:make] = params['make'] unless params['make'].blank?
      inventory[:type] = params['type'] unless params['type'].blank?


      caropts = {}
      caropts[:LEATHER] = "Yes" unless params['leather'].blank?
      caropts[:FWD] = "Yes" unless params['fourwheeldrive'].blank?
      caropts[:FOGLIGHTS] = "Yes" unless params['foglights'].blank?
      caropts[:SURROUND] = "Yes" unless params['surround'].blank?
      caropts[:DVD] = "Yes" unless params['dvd'].blank?

      @VINS = Inventory.all.where(:INVENTORY => inventory).select("VIN")

      if caropts.blank?
        @inventorys = Inventory.where(:inventories => inventory).order("DISTANCE")
      else
        @inventorys = Inventory.joins("INNER JOIN caroptions ON inventories.VIN = caroptions.VIN")
                          .where(:inventories => inventory, :caroptions => caropts)
        @sellers = Seller.select("SQRT(
    POW(69.1 * (latitude - 40.748817), 2) +
    POW(69.1 * (-73.985428 - longitude) * COS(latitude / 57.3), 2)) AS distance").order("distance")
        puts(@sellers.inspect)
      end
    end

  end

  def client
    @div = "#page-top"
    @inventorys = Inventory.order("DISTANCE")

    if params['commit'].present?
      @div = "#about"
      inventory = {}
      inventory[:make] = params['make'] unless params['make'].blank?
      inventory[:type] = params['type'] unless params['type'].blank?


      caropts = {}
      caropts[:LEATHER] = "Yes" unless params['leather'].blank?
      caropts[:FWD] = "Yes" unless params['fourwheeldrive'].blank?
      caropts[:FOGLIGHTS] = "Yes" unless params['foglights'].blank?
      caropts[:SURROUND] = "Yes" unless params['surround'].blank?
      caropts[:DVD] = "Yes" unless params['dvd'].blank?

      @VINS = Inventory.all.where(:INVENTORY => inventory).select("VIN")

      if caropts.blank? && invetonry.blank?
        @inventorys = Inventory.order("DISTANCE")
      elsif caropts.blank?
        @inventorys = Inventory.where(:inventories => inventory).order("Distance")
      elsif inventory.blank?
        @inventorys = Inventory.joins("INNER JOIN caroptions ON inventories.VIN = caroptions.VIN")
                          .where(:caroptions => caropts)
      else
        @inventorys = Inventory.joins("INNER JOIN caroptions ON inventories.VIN = caroptions.VIN")
                          .where(:inventories => inventory, :caroptions => caropts)
      end
    end

  end


end