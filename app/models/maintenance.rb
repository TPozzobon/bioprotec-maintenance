class Maintenance < ApplicationRecord
  belongs_to :equipment
  belongs_to :externalinterlocutor
  belongs_to :internalinterlocutor
end
