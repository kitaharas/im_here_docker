module NotificationsHelper
  def unchecked_notifications
    @notifications_false = current_user.passive_notifications.where(checked: false)
  end
end



