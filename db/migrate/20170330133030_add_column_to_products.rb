class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :description_ru, :text
    add_column :products, :title_ru, :string
  end
end
