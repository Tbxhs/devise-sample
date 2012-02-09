class AdminObserver < ActiveRecord::Observer
   # We check if it's a new admin
  def before_save(admin)
    @is_new_record = admin.new_record?
    true
  end

  def after_save(admin)
    # If it's not a new admin we don't want to send them another welcome email
    if @is_new_record then
      Notifier.welcome_email(admin)
    end
  end
end

