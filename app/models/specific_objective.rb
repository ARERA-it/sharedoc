class SpecificObjective < ApplicationRecord
  has_many :documents, :dependent => :destroy
end
