# frozen_string_literal: true

class MusicSearchCache < ApplicationRecord
  VERSION_MAP = {
    '1st&substream' => 1,
    '2nd style' => 2,
    '3rd style' => 3,
    '4th style' => 4,
    '5th style' => 5,
    '6th style' => 6,
    '7th style' => 7,
    '8th style' => 8,
    '9th style' => 9,
    '10th style' => 10,
    'IIDX RED' => 11,
    'HAPPY SKY' => 12,
    'DistorteD' => 13,
    'GOLD' => 14,
    'DJ TROOPERS' => 15,
    'EMPRESS' => 16,
    'SIRIUS' => 17,
    'Resort Anthem' => 18,
    'Lincle' => 19,
    'tricoro' => 20,
    'SPADA' => 21,
    'PENDUAL' => 22,
    'copula' => 23,
    'SINOBUZ' => 24,
    'CANNON BALLERS' => 25,
  }.freeze

  belongs_to :music, required: false

  scope :known, -> { where.not(music_id: nil) }
  scope :unknown, -> { where(music_id: nil) }

  class << self
    # @param attributes [] the attributes of this model
    # @return [::Music, nil]
    def search(version:, title:, genre:, artist:)
      attributes = { version: version, title: title, genre: genre, artist: artist }

      model = find_by(**attributes)
      return model.music unless model&.music.nil?

      model = new(**attributes) if model.nil?

      Music.search(
        series: find_version_value!(version),
        title: title,
        genre: genre,
        artist: artist,
      ).tap do |music|
        model.music = music if music.present?
        model.save!
      end
    end

    # @param version [String]
    # @return [Integer]
    def find_version_value!(version)
      VERSION_MAP.fetch(version) do
        raise IIDXIO::UnknownVersionError, "#{version} is unknown version"
      end
    end

    def find_version!(value)
      VERSION_MAP.key(value).tap do |k|
        raise IIDXIO::UnknownVersionError, "#{value} is unknown version" if k.nil?
      end
    end
  end

  def known?
    music_id.present? || music.present?
  end

  def unknown?
    !known?
  end
end
