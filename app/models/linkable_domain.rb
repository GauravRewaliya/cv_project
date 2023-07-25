class LinkableDomain < ApplicationRecord
  belongs_to :domain
  belongs_to :connectable, polymorphic: true
end
