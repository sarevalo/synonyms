require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'API::V1::Words', type: :request do
  let!(:words) { create_list(:word, 5) }

  describe 'GET /index' do
    context 'when get words' do
      path '/api/v1/words' do
        get('Get words') do
          consumes 'application/json'
          produces 'application/json'
          tags :public

          let(:word) { word.first }

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

  describe 'POST /create' do
    path '/api/v1/words' do
      post('Create word') do
        consumes 'application/json'
        produces 'application/json'
        tags :public

        parameter name: 'params', in: :body, schema: {
          type: :object,
          properties: {
            reference: { type: :string }
          }
        }

        response '201', 'created' do
          let(:params) { attributes_for(:word) }

          schema type: :object, properties: {
            id: { type: :integer },
            reference: { type: :string }
          }

          run_test!
        end
      end
    end
  end

  describe 'PUT /update' do
    path '/api/v1/words/{id}' do
      put('Update word') do
        consumes 'application/json'
        produces 'application/json'
        tags :public

        parameter name: :id, in: :path, type: :string
        parameter name: :params, in: :body, schema: {
          type: :object,
          properties: {
            reference: { type: :string },
            synonyms: {
              type: :array,
              items: {
                type: :object,
                properties: {
                  id: { type: :integer },
                  reference: { type: :string }
                }
              }
            }
          },
          required: [
            :params
          ]
        }

        response '204', 'no content' do
          let!(:id) { words.first.id }
          let(:params) { attributes_for(:word) }

          run_test!
        end
      end
    end
  end
end
