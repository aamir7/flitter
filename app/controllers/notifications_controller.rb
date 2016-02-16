class NotificationsController < ApplicationController
  before_action :authenticate_user!
  
  def update
    if(current_user.notifications.unread_notifications.any?) 
      current_user.notifications.unread_notifications.update_all(is_read: true)
    end
    data = { :notification_count => current_user.notifications.unread_notifications.count }
    render :json => data, :status => :ok
  end
end