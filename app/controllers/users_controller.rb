# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show followers followings]
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show; end

  def followers
    @followers = @user.follower_users
  end

  def followings
    @followings = @user.following_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
