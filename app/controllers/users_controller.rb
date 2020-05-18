# users_controller.rb
class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,

    )
    response_text = "Hey, your new user is created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email)
    if user.password == password
      match = "true"
    else
      match = "false"
    end

    render plain: match
  end
end
