require 'rails_helper'

RSpec.describe 'API::V1::Backoffice::Words', type: :request do

  let(:current_owner) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: current_owner.id) }

  describe 'GET /index' do
    let!(:words) { create_list(:word, 5) }

    context 'when unauthorized' do
      before { get api_v1_backoffice_words_path }

      it { expect(response).to have_http_status(:unauthorized) }
    end

    context 'when respond with collection' do
      before { get api_v1_backoffice_words_path, headers: { Authorization: token } }

      it { expect(json['data']).not_to be_empty }
      it { expect(response).to have_http_status(:ok) }
    end

    context 'when paginate data' do
      before { get api_v1_backoffice_words_path(per_page: 2), headers: { Authorization: token } }

      it { expect(json[:data].count).to eq(2) }
      it { expect(response).to have_http_status(:ok) }
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
        put api_v1_backoffice_word_path(word.id, params: params), headers: { Authorization: token }
      end

      it { expect(response).to have_http_status(:no_content) }
      it { expect(word.reload.status).to eq('approved') }
    end
  end

  describe 'DESTROY /delete' do
    let(:word) { create(:word) }

    before do
      delete api_v1_backoffice_word_path(word.id), headers: { Authorization: token }
    end

    it { expect(response).to have_http_status(:no_content) }
  end
end
