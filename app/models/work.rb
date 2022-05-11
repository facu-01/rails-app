class Work < ApplicationRecord
  validates :title, presence: true
  belongs_to :company

  validates_uniqueness_of :title, scope: :company
end
