# frozen_string_literal: true

create_table :musics, force: :cascade, id: :bigint, unsigned: true, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4' do |t|
  t.string :name, null: false
  t.string :sub_name, null: false, default: ''
  t.string :genre, null: false
  t.string :artist, null: false
  t.string :textage_uid, null: false
  t.integer :seriese, null: false # enum
  t.boolean :leggendaria, null: false, default: false

  t.timestamps
end
