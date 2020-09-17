class EmailDeliveryObserver
  def self.delivered_email(message)
    puts ("Sent Successfully")
  end
end

ActionMailer::Base.register_observer(EmailDeliveryObserver)
