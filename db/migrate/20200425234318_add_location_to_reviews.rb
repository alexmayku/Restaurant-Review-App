class AddLocationToReviews < ActiveRecord::Migration[6.0]
  def change
    
    add_column :reviews, :adress, :text
    add_column :reviews, :latitude, :float
    add_column :reviews, :longitude, :float

  end
end
