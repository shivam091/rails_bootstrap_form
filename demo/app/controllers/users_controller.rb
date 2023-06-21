# -*- encoding: utf-8 -*-
# -*- frozen_string_literal: true -*-
# -*- warn_indent: true -*-

class UsersController < ApplicationController

  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = ::User.all
  end

  def new
    @user = ::User.new
  end

  def create
    @user = ::User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :mobile_number,
      :birth_date,
      :terms,
      :excellence,
      :blog_url,
      :fruit_id,
      :favorite_color,
      :username,
      :expected_ctc,
      :interview_date,
      :interview_time,
      :interview_datetime,
      :weekly_off,
      :gender,
      :life_story,
      skill_ids: [],
      address_attributes: [
        :street,
        :state,
        :city,
        :postal_code,
        :country_id,
      ]
    )
  end

  def find_user
    @user = ::User.find(params.fetch(:id))
  end
end
