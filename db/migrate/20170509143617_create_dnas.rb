class CreateDnas < ActiveRecord::Migration[5.0]
  def change
    create_table :dnas do |t|
      t.string :name
      t.string :attachment

      t.timestamps
    end
  end
end
