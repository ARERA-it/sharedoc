class AddBlurringFolderToSo < ActiveRecord::Migration[5.2]
  def change
    add_column :specific_objectives, :blurring_folder, :string, limit: 50
  end
end
