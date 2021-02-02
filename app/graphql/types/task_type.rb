module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, Types::BaseEnum, null: false
  end
end
