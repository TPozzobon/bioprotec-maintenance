class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor
  belongs_to :internal_interlocutor

  validates :title, :date, :description, :status, presence: true
end
