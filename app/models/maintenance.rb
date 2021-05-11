class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor
  belongs_to :user

  validates :name, :start_time, :end_time, :description, :status, presence: true
end
