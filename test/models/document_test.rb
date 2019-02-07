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

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
