class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor
  belongs_to :user

  validates :title, :start_date, :end_date, :description, :status, presence: true
end
