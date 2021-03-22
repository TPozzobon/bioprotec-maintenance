class Equipment < ApplicationRecord
  has_many :maintenances
  has_many :external_interlocutors, through: :maintenances
  has_many :internal_interlocutors, through: :maintenances
end
