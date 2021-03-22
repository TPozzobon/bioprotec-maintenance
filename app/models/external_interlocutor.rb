class ExternalInterlocutor < ApplicationRecord
  has_many :maintenances
  has_many :equipment, through: :maintenances
end
