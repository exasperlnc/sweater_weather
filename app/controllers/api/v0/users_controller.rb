class Api::V0::UsersController < ApplicationController
  def create
    data = request.raw_post
    user = User.new(JSON.parse(data))
    if user.save
      render json: UsersSerializer.new(user), status: 201
    else
      render json: { errors: user.errors.full_messages.to_sentence }, status: 400
    end
  end
end