class InternalInterlocutor < ApplicationRecord
  has_many :maintenances
  has_many :equipment
end
