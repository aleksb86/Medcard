# frozen_string_literal: true

module Api
  module V1
    class CardsController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @cards = Card.all
      end
    end
  end
end
