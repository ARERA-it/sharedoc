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
    so_folder = specific_objective.sharepoint_folder
    site.folder.add_folder(so_folder)
    folder = site.folder(so_folder)
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
