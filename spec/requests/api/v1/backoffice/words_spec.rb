require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'API::V1::Backoffice::Words', type: :request do
  let(:current_owner) { create(:user) }
  let(:token) { JsonWebToken.encode(user_id: current_owner.id) }
  let!(:words) { create_list(:word, 5) }

  describe 'GET /index' do
    context 'Get words' do
      path '/api/v1/backoffice/words' do
        get('Get words') do
          consumes 'application/json'
          produces 'application/json'
          tags :backoffice

          let(:Authorization) { "Bearer #{token}" }

          parameter name: 'Authorization', :in => :header, :type => :string

          response '200', 'words' do
            schema type: :object, properties: {
              data: {
                type: :array,
                items: {
                  type: :object,
                  properties: {
                    id: { type: :integer },
                    reference: { type: :string },
                    status: { type: :string, enum: ::Word.statuses.keys }
                  }
                }
              },
              meta: {
                '$ref' => '#/components/schemas/meta'
              }
            }

            run_test!
          end
        end
      end
    end
  end
end
