# frozen_string_literal: true

module Api
  module V1
    class TracksController < ApplicationController
      def index
        @tracks = Track.all
        render json: @tracks
      end
    end
  end
end
