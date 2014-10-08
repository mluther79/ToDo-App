class Task < ActiveRecord::Base
  validates :title, presence: true, length: { in: 3..254 }
end