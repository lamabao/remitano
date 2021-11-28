class CreateSharemovie < ActiveRecord::Migration[5.2]
  def change
    create_table :sharemovies do |t|
      t.string :title
      t.integer :iduser
      t.text :description
      t.integer :numberlike
      t.integer :numberdislink
      t.string :idyoutube
    end
  end
end
