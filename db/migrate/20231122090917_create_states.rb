class CreateStates < ActiveRecord::Migration[7.0]
  def change
    create_table :states do |t|
      t.string :name, null: false, unique: true

      t.timestamps
    end
  end
end
