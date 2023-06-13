class Api::V0::SessionsController < ApplicationController
  def create
    data = request.raw_post
    user = User.find_by(email: JSON.parse(data)["email"])
    if user && user.authenticate(JSON.parse(data)["password"])
      render json: UsersSerializer.new(user), status: 200
    else
      render json: { errors: "Invalid Credentials" }, status: 400
    end
  end
end