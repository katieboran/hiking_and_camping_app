class CampingReview < ApplicationRecord
  # Direct associations

  has_one    :camping_site,
             :foreign_key => "capacity"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
