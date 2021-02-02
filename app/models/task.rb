class Task < ApplicationRecord
  belongs_to :user

  validates :name, :status, presence: true

  enum status: %i[todo in_progress done]
end
