# frozen_string_literal: true

module Types
  module Object
    class QueryType < Base
      # Add root-level fields here.
      # They will be entry points for queries on your schema.

      field :user, UserType, null: true do
        description 'Find a user by ID'
        argument :id, ID, required: true
      end

      def user(id:)
        User.find(id)
      end
    end
  end
end
