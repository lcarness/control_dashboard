class Note < ApplicationRecord
  # Direct associations

  belongs_to :inputs,
             :class_name => "Input",
             :counter_cache => true

  # Indirect associations

  # Validations

end
