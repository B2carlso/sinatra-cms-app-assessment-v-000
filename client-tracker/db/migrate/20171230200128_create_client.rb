class CreateClient < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.integer :age
      t.integer :trainer_id
    end
  end
end
