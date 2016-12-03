class State < ApplicationRecord
  # Direct associations

  has_many   :parks,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
