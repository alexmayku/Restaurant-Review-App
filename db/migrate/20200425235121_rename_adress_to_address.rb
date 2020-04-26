class RenameAdressToAddress < ActiveRecord::Migration[6.0]
  def change
    
    rename_column :reviews, :adress, :address

  end
end
