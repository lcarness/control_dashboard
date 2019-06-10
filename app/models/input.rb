class Input < ApplicationRecord
  # Direct associations

  has_many   :notes,
             :foreign_key => "inputs_id",
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
