# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Stockitems', type: :request do
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
    end
  end

  describe "POST /api/v1/stores" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          store: {
            name: "Fake teste store 5165",
            street: "Algodoeiro",
            neighborhood: "Eletronorte",
            city: "Porto Velho",
            cep: 76808518,
        }
        }
      end

      it "creates a new Store" do
        expect { post "/api/v1/stores", params: valid_params }.to change(Store, :count).by(+1)
        expect(response).to have_http_status(200)
      end
    end
  end


  describe 'POST /api/v1/stockitems' do
    context 'with valid parameters' do
      let(:valid_params) do
        {
          stockitem: {
            product_id: 1,
            store_id: 1,
            quantities: 4
          }
        }
      end

      it 'creates a new stock itens' do
        expect { post '/api/v1/stockitems', params: valid_params }.to change(Stockitem, :count).by(+1)
        expect(response).to have_http_status(200)
      end

      it 'creates a stock itens with the correct attributes' do
        post '/api/v1/stores', params: valid_params
        expect(Stockitem.last).to have_attributes valid_params[:stockitems]
      end
    end
  end
end
