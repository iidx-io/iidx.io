# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IIDXMusic do
  describe '.search' do
    subject { described_class.search(**attributes) }

    context 'when there is a record and it belongs to music' do
      before { iidx_music }

      let(:music) { create(:music) }
      let(:iidx_music) { create(:iidx_music, **attributes, music: music) }
      let(:attributes) { attributes_for(:iidx_music) }

      it 'returns the hit music model' do
        expect(subject).to eq music
      end
    end

    context 'when there is a record but it dose not belong to music' do
      before { iidx_music }

      let(:iidx_music) do
        create(:iidx_music, **attributes)
      end

      shared_examples 'search a music' do
        it 'returns a search result of music model' do
          expect(subject).to eq music
        end

        it 'saves a music id to the record' do
          subject
          expect(iidx_music.reload.music).to eq music
        end
      end

      context 'without sub titles' do
        let(:music) { create(:music, title: 'title', sub_title: '', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end

      context 'with a whitespace and a sub title' do
        let(:music) { create(:music, title: 'title', sub_title: '(sub title)', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title (sub title)', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end

      context 'with no whitespaces and a sub title' do
        let(:music) { create(:music, title: 'title', sub_title: '(sub title)', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title(sub title)', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end
    end

    context 'when there are no records' do
      shared_examples 'search a music' do
        it 'returns a search result of music model' do
          expect(subject).to eq music
        end

        it 'inserts a new record with the music' do
          subject
          expect(described_class.last).to have_attributes(**attributes, music: music)
        end
      end

      context 'without sub titles' do
        let(:music) { create(:music, title: 'title', sub_title: '', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end

      context 'with a whitespace and a sub title' do
        let(:music) { create(:music, title: 'title', sub_title: '(sub title)', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title (sub title)', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end

      context 'with no whitespaces and a sub title' do
        let(:music) { create(:music, title: 'title', sub_title: '(sub title)', series: 1) }

        let(:attributes) do
          { version: '1st&substream', title: 'title(sub title)', genre: music.genre, artist: music.artist }
        end

        include_examples 'search a music'
      end
    end
  end
end
