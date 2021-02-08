require 'rails_helper'

RSpec.describe Mutations::CreateTask, type: :request do
  describe '.resolve' do
    let(:user) { create(:user) }
    let(:mutation) do
      <<~GQL
        mutation {
          createTask(
            input: {
              name: "Foolish"
              status: "todo"
              userId: #{user.id}
            }
          ) {
            id
            name
            status
            user {
              name
            }
          }
        }
      GQL
    end

    it 'creates a task' do
      expect do
        post '/graphql', params: { query: mutation }
      end.to change { Task.count }.by(1)
    end

    it 'returns a task object' do
      post '/graphql', params: { query: mutation }

      json = JSON.parse(response.body, symbolize_names: true)
      data = json[:data][:createTask]

      expect(data[:name]).to eq('Foolish')
      expect(data[:status]).to eq('todo')
      expect(data[:user][:name]).to eq(user.name)
    end
  end
end
