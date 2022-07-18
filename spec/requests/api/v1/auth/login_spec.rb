require 'rails_helper'
require 'swagger_helper'

RSpec.describe 'AuthenticationController', type: :request do
  let(:current_owner) { create(:user) }

  describe 'POST authentication#login' do
    path '/api/v1/auth/login' do
      post 'create token' do
        consumes 'application/json'
        produces 'application/json'
        tags :auth

        parameter name: :data, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            password: { type: :string, format: :password }
          },
          required: [
            :data
          ]
        }

        response '201', 'created' do
          let!(:data) do
            {
              name: current_owner.name,
              password: '$dm!nhola123'
            }
          end

          schema type: :object, properties: {
            token: { type: :string },
            exp: { type: :string },
            name: { type: :string }
          }

          run_test!
        end
      end
    end
  end
end
