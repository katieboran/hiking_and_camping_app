class HikingReview < ApplicationRecord
  # Direct associations

  has_one    :hiking_trail,
             :foreign_key => "review_id"

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
