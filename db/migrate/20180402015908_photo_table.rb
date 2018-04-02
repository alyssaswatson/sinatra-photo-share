class PhotoTable < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :link
      t.string :caption
    end
  end
end
