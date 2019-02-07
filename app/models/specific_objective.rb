# == Schema Information
#
# Table name: specific_objectives
#
#  id         :integer          not null, primary key
#  name       :string
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SpecificObjective < ApplicationRecord
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents

  def sharepoint_folder
    "ob_spec_#{id}"
  end

  def sharepoint_files(reload=false)
    if !@files || reload
      @files = SharepointSite.new.folder(sharepoint_folder).files
    end
    @files
  rescue
    []
  end
end
