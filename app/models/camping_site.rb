class CampingSite < ApplicationRecord
  # Direct associations

  belongs_to :camping_review,
             :foreign_key => "capacity"

  belongs_to :park,
             :foreign_key => "review_id",
             :counter_cache => true

  # Indirect associations

  # Validations

end
