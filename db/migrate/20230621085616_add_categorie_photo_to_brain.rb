class AddCategoriePhotoToBrain < ActiveRecord::Migration[7.0]
  def change
    add_column :brains, :categorie, :string
    add_column :brains, :photo_url, :text
  end
end
