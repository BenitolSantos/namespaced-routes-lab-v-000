class CreatePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :preferences do |t|
      t.integer :artist_id
      t.integer :song_id
    end
  end
end
