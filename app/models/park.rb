class Park < ApplicationRecord
  # Direct associations

  has_many   :camping_sites,
             :foreign_key => "review_id",
             :dependent => :destroy

  has_many   :hiking_trails,
             :dependent => :destroy

  belongs_to :state,
             :counter_cache => true

  # Indirect associations

  # Validations

end
