class NotificationsController < ApplicationController
  
  #  PATCH /notifications/read_all_notification
  def read_all
    unread_notifications = current_user.notifications.unread
    if unread_notifications.any?
      unread_notifications.update_all(is_read: true)
    end
    
    @notification_count  = current_user.notifications.unread.count
    respond_to do |format|
      format.js
    end
  end
end
