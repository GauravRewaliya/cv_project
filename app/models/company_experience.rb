class CompanyExperience < ApplicationRecord
  belongs_to :curriculum_vitae ,optional: true
  validates :company_name , :role , presence: true
end
