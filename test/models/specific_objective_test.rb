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

require 'test_helper'

class SpecificObjectiveTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
