class TweetsController < ApplicationController
  before_action :authenticate_user!

  def my_tweets
    @tweets = current_user.tweets.order('tweets.created_at desc')
  end
end
