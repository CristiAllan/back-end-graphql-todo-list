module Mutations
  class UpdateTaskStatus < BaseMutation
    argument :id, ID, required: true
    argument :status, String, required: true

    field :task, Types::TaskType, null: false

    def resolve(id:, status:)
      Task.find(id).update!(status: status)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
