class ExternalInterlocutor < ApplicationRecord
  has_many :maintenances
  has_many :equipment

  validates :name, :status, presence: true
end
