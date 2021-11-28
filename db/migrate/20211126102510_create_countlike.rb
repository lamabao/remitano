class CreateCountlike < ActiveRecord::Migration[5.2]
  def change
    create_table :countlikes do |t|
      t.integer :iduser
      t.integer :idvideo
      t.integer :numberlike
      t.integer :numberdislink
    end
  end
end
