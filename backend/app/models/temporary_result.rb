# typed: false
# frozen_string_literal: true

class TemporaryResult < ApplicationRecord
  belongs_to :user
  belongs_to :result_batch, optional: true

  include ClearLampEnum
  include GradeEnum
  include PlayStyleEnum
  include DifficultyEnum

  class << self
    def bulk_convert_to_result
      find_in_batches do |temp_results|
        result_sets = temp_results.map { |temp_result| [temp_result.id, temp_result.to_result] }.to_h.compact

        Result.import(result_sets.values)

        destroy(result_sets.keys)
      end
    end
  end

  def to_result
    music = Music.find_by(csv_title: title)
    return nil if music.nil?

    map = music.find_map(play_style, difficulty)
    return nil if map.nil?

    Result.new(
      user: user,
      result_batch: result_batch,
      map: map,
      score: score,
      miss_count: miss_count,
      clear_lamp: clear_lamp,
      grade: grade,
      last_played_at: last_played_at,
    )
  end
end
