class NotificationJob < ApplicationJob
  queue_as :default  
  
  # 1) At midnight? start job
    # 2) Call weather_service to upsert 48hr forecast
    # 3) Destroy data that is in the past
    # 4) 

end