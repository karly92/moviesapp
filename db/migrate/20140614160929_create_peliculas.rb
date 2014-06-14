class CreatePeliculas < ActiveRecord::Migration
  def change
    create_table :peliculas do |t|
      t.string :titulo
      t.integer :anio
      t.string :genero
      t.string :actores
      t.string :imagen

      t.timestamps
    end
  end
end
