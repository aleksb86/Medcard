# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :find_category, only: %i[show]

      def index
        @categories = Category.all
      end

      def show; end

      private

      def find_category
        @category = Category.find_by(id: params[:id])
        head 404 unless @category
      end
    end
  end
end
