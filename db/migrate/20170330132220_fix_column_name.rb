class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :products, :title, :title_en
  	rename_column :products, :description, :description_en
  	rename_column :categories, :name, :name_en
  end
end
