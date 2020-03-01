# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user, except: %i[create]
      before_action :find_user, only: %i[destroy update]
      skip_before_action :verify_authenticity_token

      def show
        @current_user = current_user
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render :create, status: :created
        else
          render :create, status: :unprocessable_entity
        end
      end

      def update
        # if admin - update by ID, if user - update current_user
        @user.update_attributes(user_params)
        render :update
      end

      def destroy
        @user.inactivate # current user is admin
        # current_user.inactivate # ordinary user
        render :destroy
      end

      private

      def user_params
        params.require(:user).permit(%i[email password phone])
      end

      def find_user
        @user = User.find_by(id: params[:id])
        head :not_found unless @user
      end
    end
  end
end
