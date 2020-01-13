class UsersController < ApplicationController
  before_action :authenticate_user!
  def all_users
    @all_users = User.where.not(id: current_user.id)
  end
  def my_followers
    @my_followers = current_user.followers
  end

  def follow
    @response = { status: false, message: "" }
    if params[:follower_id].present?
      @check_user = User.find_by(id: params[:follower_id])
      if @check_user.present?
        @existing_follower = current_user.followers.where(follower_id: @check_user.id).first
        if @existing_follower.present?
          @response["message"] ="Already following"
        else
          @follower = Follower.create({ user_id: current_user.id,
                            follower_id: params[:follower_id]
                          })
          if @follower.errors.present?
            @response["message"] = @follower.errors.full_messages.to_sentence
          else
            @response['status'] = true
            @response["message"] = "User follow complete"
          end
        end
      else
        @response["message"] ="User does not exists"
      end
    else
      @response["message"] ="Params not complete"
    end
  end
end
