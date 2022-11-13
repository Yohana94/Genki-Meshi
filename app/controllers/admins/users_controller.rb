# frozen_string_literal: true

class Admins::UsersController < ApplicationController
  def index
    @users = User.all
  end
end
