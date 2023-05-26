class Profile < ApplicationRecord
  # belongs_to :skill
  #  has_one :skill
  #  has_one :Tag_stack

  # validates :candidate, presence: true
  # validates :candidate, uniqueness: true

  belongs_to :candidate, optional: true

  has_many :profile_supportive_techs
  has_many :supportive_skills, through: :profile_supportive_techs, source: :tech_stack


  has_one :profile_core_tech , dependent: :destroy
  has_one :core_skill, through: :profile_core_tech, source: :tech_stack 
                                                                  # dependent dest not work on through
  # accepts_nested_attributes_for :profile_core_tech , reject_if: :all_blank#:reject_core_skill_blank
  
end
