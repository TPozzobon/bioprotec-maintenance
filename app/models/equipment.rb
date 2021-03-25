class Equipment < ApplicationRecord
  has_many :maintenances
  has_many :external_interlocutors
end
