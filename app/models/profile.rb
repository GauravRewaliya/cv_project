class Profile < ApplicationRecord
  # belongs_to :skill
  #  has_one :skill
  #  has_one :Tag_stack

  # validates :candidate, presence: true
  # validates :candidate, uniqueness: true

  # belongs_to :candidate, optional: true

  belongs_to :candidate

end
