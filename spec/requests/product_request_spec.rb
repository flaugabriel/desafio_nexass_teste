# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'POST /api/v1/products' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          product: {
            name: 'Fake teste product 1',
            price: 250.0
          }
        }
      end

      it 'creates a new Product' do
        expect { post '/api/v1/products', params: valid_params }.to change(Product, :count).by(+1)
        expect(response).to have_http_status(200)
      end

      it 'creates a Product with the correct attributes' do
        post '/api/v1/products', params: valid_params
        expect(Product.last).to have_attributes valid_params[:product]
      end
    end
  end

  describe 'PUT /api/v1/products' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          product: {
            name: 'Fake teste product 1',
            price: 254.14
          }
        }
      end

      it 'update Product' do
        expect { post '/api/v1/products', params: valid_params }.to change(Product, :count).by(+1)
        expect(response).to have_http_status(200)
      end

      it 'update a Product with the correct attributes' do
        post '/api/v1/products', params: valid_params
        expect(Product.last).to have_attributes valid_params[:product]
      end
    end
  end
end
