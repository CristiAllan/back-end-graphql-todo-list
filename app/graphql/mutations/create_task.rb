module Mutations
  class CreateTask < BaseMutation
    # arguments are the fields to send in the request to create a new task
    argument :name, String, required: true
    argument :status, String, required: true
    argument :user_id, ID, required: true

    type Types::TaskType

    def resolve(name:, status:, user_id:)
      Task.create!(
        name: name,
        status: status,
        user: User.find(user_id)
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
