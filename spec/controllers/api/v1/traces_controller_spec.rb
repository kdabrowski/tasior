require 'rails_helper'

RSpec.describe Api::V1::TracesController, type: :controller do
  let!(:trace) { create(:trace, geo:
    [
      { "latitude": 32.9377784729004, "longitude": -117.230392456055},
      { "latitude": 32.937801361084, "longitude": -117.230323791504},
      { "latitude": 32.9378204345703, "longitude": -117.230278015137},
      { "latitude": 32.9378204345703, "longitude": -117.230239868164},
      { "latitude": 32.9378318786621, "longitude": -117.230209350586}
    ]
                       )
  }
  let!(:trace2) { create(:trace, geo:
    [
      { "latitude": 32.9377784729004, "longitude": -117.230392456055},
      { "latitude": 32.937801361084, "longitude": -117.230323791504},
      { "latitude": 32.9378204345703, "longitude": -117.230278015137},
      { "latitude": 32.9378204345703, "longitude": -117.230239868164},
      { "latitude": 32.9378318786621, "longitude": -117.230209350586}
    ]
                       )
  }

  describe 'traces#index' do
    before :each do
      get :index, format: :json
    end

    it "returns status code 200" do
      expect(response.status).to eq(200)
    end

    it "returns trace with geo entries" do
      expect(JSON.parse(response.body)).to eq([trace.geo, trace2.geo])
    end
  end

  describe 'traces#show' do
    before :each do
      get :show, id: trace.id ,format: :json
    end

    it "returns status code 200" do
      expect(response.status).to eq(200)
    end

    it "returns trace with geo entries" do
      expect(JSON.parse(response.body)).to eq(trace.geo)
    end
  end

  describe 'traces#create' do
    let(:params) do
      {geo: [
        { "latitude": 32.9377784729004, "longitude": -117.230392456055},
        { "latitude": 32.937801361084, "longitude": -117.230323791504}
      ]
      }
    end
    before :each do
      post :create, trace: params ,format: :json
    end

    it "returns status code 200" do
      expect(response.status).to eq(201)
    end

    it "returns trace with geo entries" do
      expect(response.body).to eq(params[:geo].to_json)
    end
  end

  describe 'traces#update' do
    let(:params) do
      {geo: [
        { "latitude": 32.9377784729004, "longitude": -117.230392456055},
        { "latitude": 32.937801361084, "longitude": -117.230323791504}
      ]
      }
    end
    before :each do
      put :update, id: trace.id,  trace: params ,format: :json
    end

    it "returns status code 204" do
      expect(response.status).to eq(204)
    end

    it "returns empty response" do
      expect(response.body).to eq("")
    end
  end

  describe 'traces#destroy' do
    before :each do
      delete :destroy, id: trace.id, format: :json
    end

    it "returns status code 204" do
      expect(response.status).to eq(204)
    end

    it "returns empty response" do
      expect(response.body).to eq("")
    end
  end
end
