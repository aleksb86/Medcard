# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user

      def current
        @current_user = current_user
      end
    end
  end
end
