class Equipment < ApplicationRecord
  has_many :maintenances, dependent: :destroy
end
