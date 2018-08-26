# frozen_string_literal: true

module Types
  module Object
    class QueryType < Base
      # Add root-level fields here.
      # They will be entry points for queries on your schema.

      field :viewer, UserType, null: true do
        description 'The currently authenticated user.'
      end

      delegate :viewer, to: :context

      field :user, UserType, null: true do
        description 'Find a user by ID.'
        argument :id, ID, required: true
      end

      def user(id:)
        User.find(id)
      end

      field :musics, [MusicType], null: true do
        description 'Find musics.'
      end

      def musics
        ::Music.includes('maps').where(maps: { level: 12, play_style: :sp })
      end
    end
  end
end
