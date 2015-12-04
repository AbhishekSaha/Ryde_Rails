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


  def client
    @inventorys = Inventory.all
    if params['commit'].present?

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

      if caropts.blank?
        @inventorys = Inventory.where(:inventories => inventory)
      else
        @inventorys = Inventory.joins("INNER JOIN caroptions ON inventories.VIN = caroptions.VIN")
                          .where(:inventories => inventory, :caroptions => caropts)
      end
    end

  end


end