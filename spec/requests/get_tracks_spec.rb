# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:track, 10)
      get '/api/v1/tracks'
    end

    it 'returns all tracks' do
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end
