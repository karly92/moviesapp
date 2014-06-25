class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.text :contenido

      t.timestamps
    end
  end
end
