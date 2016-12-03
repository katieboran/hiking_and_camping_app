class Park < ApplicationRecord
  # Direct associations

  belongs_to :state,
             :counter_cache => true

  # Indirect associations

  # Validations

end
