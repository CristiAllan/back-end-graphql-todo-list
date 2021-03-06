module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, String, null: false
    field :user, Types::UserType, null: false
  end
end
