class Park < ApplicationRecord
  # Direct associations

  has_many   :hiking_trails,
             :dependent => :destroy

  belongs_to :state,
             :counter_cache => true

  # Indirect associations

  # Validations

end
