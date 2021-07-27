class Fight < ApplicationRecord
  belongs_to :winner, optional: true
end
