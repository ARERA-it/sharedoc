# == Schema Information
#
# Table name: documents
#
#  id                    :integer          not null, primary key
#  specific_objective_id :integer
#  unique_id             :string
#  filename              :string
#  author                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class Document < ApplicationRecord
  attr_accessor :file
  belongs_to :specific_objective

  before_save do |d|
    site = SharepointSite.new
    folders = specific_objective.sharepoint_folder # ["ob_spec_8", "aamjjsduja"]
    folders.each_with_index do |folder, idx|
      # creo i 2 livelli di cartelle
      site.folder(File.join(folders[0...idx])).add_folder(folder)
    end
    folder = site.folder(File.join(folders))
    f = folder.add_file(file.original_filename, file.read)
    d.filename = file.original_filename
    d.unique_id = f.unique_id
    d.author = "Iwan Buetti"
  end

  def sharepoint_file(reload=false)
    specific_objective.sharepoint_files(reload).select{|f| f.unique_id==unique_id}.first
  end

  def versions
    sharepoint_file.versions
  end
end
