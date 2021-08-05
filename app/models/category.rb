class Category < ApplicationRecord
  validates :title, length: { in: 1..32 }

  has_many :todo
end
