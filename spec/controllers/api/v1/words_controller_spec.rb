require 'rails_helper'

RSpec.describe 'API::V1::Words', type: :request do
  describe 'GET /index' do
    let!(:words) { create_list(:word, 5) }

    context 'when respond with collection' do
      before { get api_v1_words_path }

      it { expect(json['data']).not_to be_empty }
      it { expect(response).to have_http_status(:ok) }
    end

    context 'when filter by' do
      let(:word) { words.first }

      before { get api_v1_words_path(reference_eq: word.reference) }

      it { expect(json[:data].count).to eq(1) }
      it { expect(response).to have_http_status(:ok) }
    end
  end

  describe 'POST /create' do
    let(:word) { attributes_for(:word) }

    context 'when create a word' do
      before { post api_v1_words_path(params: word) }

      it { expect(response).to have_http_status(:created) }
    end

    context 'when missing reference' do
      let(:word) { { reference: '' } }

      before { post api_v1_words_path(params: word) }

      it { expect(json['error']['reference']).to include("can't be blank") }
      it { expect(response).to have_http_status(:unprocessable_entity) }
    end
  end

  describe 'PUT /update' do
    let(:word) { create(:word, status: :pending) }
    let(:synonym) { create(:synonym, word: word) }
    let(:params) do
      attributes_for(
        :word,
        synonyms: [attributes_for(:synonym, id: synonym.id)]
      )
    end

    context 'when update a word' do
      before do
        put api_v1_word_path(word.id, params: params)
      end

      it { expect(response).to have_http_status(:no_content) }
    end
  end
end
