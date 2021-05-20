class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor
  belongs_to :user

  validates :name, :start_time, :end_time, :description, :status, presence: true

  default_scope -> { order(:start_time) }  # Our meetings will be ordered by their start_time by default
  
  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
  
  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end
end
