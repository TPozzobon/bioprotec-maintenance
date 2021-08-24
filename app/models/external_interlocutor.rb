class ExternalInterlocutor < ApplicationRecord
  has_many :maintenances

  validates :name, :status, presence: true
end
