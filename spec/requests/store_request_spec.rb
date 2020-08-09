require 'rails_helper'

RSpec.describe "Stores", type: :request do
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

      it "creates a Store with the correct attributes" do
        post "/api/v1/stores", params: valid_params
        expect(Store.last).to have_attributes valid_params[:store]
      end
    end
  end

  describe "PUT /api/v1/stores" do
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

      it "update Store" do
        expect { post "/api/v1/stores", params: valid_params }.to change(Store, :count).by(+1)
        expect(response).to have_http_status(200)
      end

      it "update a Store with the correct attributes" do
         post "/api/v1/stores", params: valid_params
         expect(Store.last).to have_attributes valid_params[:store]
      end
    end
  end
end
