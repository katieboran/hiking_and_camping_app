class HikingTrail < ApplicationRecord
  # Direct associations

  belongs_to :park,
             :counter_cache => true

  belongs_to :review,
             :class_name => "HikingReview"

  # Indirect associations

  # Validations

end
