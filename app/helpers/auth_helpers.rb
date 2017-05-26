
helpers do
  def logged_in?
    !!session[:user_id]
  end

  def author?(user_id)
    session[:user_id] == user_id
  end

  def authorized?(id)
    session[:user_id] == id
    end

  def subscribed?(channel_id)
    user = User.find_by(id: session[:user_id])
    user.subscriptions.each do  |sub|
      if sub.channel.id == channel_id
        return false
      end
    end
    return true
  end

  def find_subscription_id(channel_id)
    user = session[:user_id]

    sub =Subscription.where("user_id = :user_id and channel_id = :channel_id", {user_id: "#{user}", channel_id: "#{channel_id}" })
    return sub[0].id
  end
end
