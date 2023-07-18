class CandidateSupportiveTech < ApplicationRecord
  belongs_to :candidate
  belongs_to :tech_stack
end
