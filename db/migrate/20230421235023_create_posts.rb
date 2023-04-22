class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :titulo
      t.string :sigla_ramo
      t.integer :precio
      t.text :descripcion
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
