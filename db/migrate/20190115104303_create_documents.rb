class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.integer :specific_objective_id
      t.string :unique_id
      t.string :filename
      t.string :author

      t.timestamps
    end
  end
end
