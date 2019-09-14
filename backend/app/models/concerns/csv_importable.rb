# frozen_string_literal: true

module CSVImportable
  extend ActiveSupport::Concern

  # @param csv [String]
  # @param play_style [:sp, :dp]
  def import_results_from_csv(csv, play_style)
    table = IIDXIO::CSVParser.parse(csv)

    ApplicationRecord.transaction do
      result_batch = result_batches.create

      table.rows.each_slice(1000) do |rows|
        musics = CSVImporter::MusicCollection.new(
          titles: rows.map(&:title),
        )
        maps = CSVImporter::MapCollection.new(
          play_style: play_style,
          musics: musics,
        )
        results = CSVImporter::ResultCollection.new(
          user: self,
          maps: maps,
        )

        rows.each do |row|
          row_processor = CSVImporter::RowProcessor.new(
            results: results,
            play_style: play_style,
            row: row,
            result_batch: result_batch,
          )

          row_processor.import_results
        end
      end
    end
  end
end
