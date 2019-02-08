# == Schema Information
#
# Table name: specific_objectives
#
#  id              :integer          not null, primary key
#  name            :string
#  comments        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  blurring_folder :string(50)
#

class SpecificObjective < ApplicationRecord
  has_many :documents, dependent: :destroy
  accepts_nested_attributes_for :documents

  before_create do |so|
    so.blurring_folder = SpecificObjective.random_string
  end

  def sharepoint_folder
    blurring_folder ? [so_folder, blurring_folder] : [so_folder]
  end

  def so_folder
    "ob_spec_#{id}"
  end

  def SpecificObjective.random_string
    string_size = 50
    (0...string_size).map { ('a'..'z').to_a[rand(26)] }.join
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
