class CreateRules < ActiveRecord::Migration[5.0]
  def change
    create_table :rules do |t|
      t.string :antedecent
      t.text :consequent, array: true, default: []
      t.string :category
      t.timestamps
    end
  end
end
