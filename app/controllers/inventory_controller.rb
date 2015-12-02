class InventoryController < ApplicationController

  layout 'application'

  def client
    @inventory = Inventory.all
  end

  def query
    render 'client'
    @inventory = Inventory.first
  end

end