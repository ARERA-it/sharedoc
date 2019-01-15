class CreateSpecificObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :specific_objectives do |t|
      t.string :name
      t.text :comments

      t.timestamps
    end
  end
end
