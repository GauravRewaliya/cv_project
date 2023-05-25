class Profile < ApplicationRecord
  # belongs_to :skill
  #  has_one :skill
  #  has_one :Tag_stack

  # validates :candidate, presence: true
  # validates :candidate, uniqueness: true

  belongs_to :candidate, optional: true

  has_many :profile_supportive_techs
  has_many :supportive_skills, through: :profile_supportive_techs, source: :tech_stack

end
