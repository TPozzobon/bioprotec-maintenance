class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor

  validates :title, :date, :description, :status, presence: true
end
