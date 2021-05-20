class Equipment < ApplicationRecord
  has_many :maintenances, dependent: :destroy

  validates :name, :status, presence: true
end
