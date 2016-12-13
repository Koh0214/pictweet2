class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tweets = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if current_user.id == tweet.user_id
      tweet.destroy
    end
  end
end
