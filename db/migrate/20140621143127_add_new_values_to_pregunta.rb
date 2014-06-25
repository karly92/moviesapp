class AddNewValuesToPregunta < ActiveRecord::Migration
  def change
    add_column :pregunta, :tipo, :string
  end
end
