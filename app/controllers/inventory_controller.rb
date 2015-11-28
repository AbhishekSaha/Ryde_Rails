class InventoryController < ApplicationController

  layout 'application'

  def client
    @inventory = Inventory.all
  end

end