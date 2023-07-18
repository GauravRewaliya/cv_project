class LinkableCoreTech < ApplicationRecord
  belongs_to :tech_stack
  belongs_to :connectable , polymorphic: true
end
