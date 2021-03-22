class Maintenance < ApplicationRecord
  belongs_to :equipment

  validates :title, :date, :description, :status, presence: true
end
