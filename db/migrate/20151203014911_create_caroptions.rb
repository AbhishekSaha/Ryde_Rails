class CreateCaroptions < ActiveRecord::Migration
  def change
    create_table :caroptions do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
