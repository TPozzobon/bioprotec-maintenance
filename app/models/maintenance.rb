class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :external_interlocutor, optional: true
  belongs_to :user, optional: true

  validates :name, :start_time, :end_time, :status, presence: true
  
  def time
    "#{start_time.strftime('%I:%M %p')} - #{end_time.strftime('%I:%M %p')}"
  end
  
  def multi_days?
    (end_time.to_date - start_time.to_date).to_i >= 1
  end
end
