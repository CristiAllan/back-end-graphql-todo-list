module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :tasks, [Types::TaskType], null: true
    field :todo_tasks_count, Integer, null: true

    def todo_tasks_count
      object.tasks.where(status: :todo).count
    end
  end
end
