class CreateExperiments < ActiveRecord::Migration[6.0]
  def change
    create_table :experiments do |t|
      t.string :token, unique: true
      t.string :button_color, null: false
      t.string :price, null: false

      t.timestamps
    end
  end
end
