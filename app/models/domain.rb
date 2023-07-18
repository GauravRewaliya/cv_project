class Domain < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    has_many :project_domains , dependent: :destroy
    has_many :projects, through: :project_domains
end
