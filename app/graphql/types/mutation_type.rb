module Types
  class MutationType < Types::BaseObject
    field :destroy_task, mutation: Mutations::DestroyTask
    field :update_task_status, mutation: Mutations::UpdateTaskStatus
    field :create_task, mutation: Mutations::CreateTask
  end
end
