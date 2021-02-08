module Mutations
  class DestroyTask < BaseMutation
    argument :id, ID, required: true

    type Types::TaskType

    def resolve(id:)
      Task.find(id).destroy
    end
  end
end
