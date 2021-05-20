class ExternalInterlocutor < ApplicationRecord
  has_many :maintenances
  has_many :equipment

  validates :name, presence: true
end
