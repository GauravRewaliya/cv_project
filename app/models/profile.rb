class Profile < ApplicationRecord
  validates :gender ,:address, presence: true
  # cont 
  # email
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,message: "not a valid email address"}  
                                                                                          # on: ,without:
  validates :contact ,:presence => true,
                        :numericality => true,
                          :length => {is: 10}
  belongs_to :candidate

end
