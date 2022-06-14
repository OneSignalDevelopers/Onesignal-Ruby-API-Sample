require 'dotenv/load'
require 'time'
require 'onesignal'

rest_api_key = ENV['ONESIGNAL_REST_API_KEY']
app_id = ENV['ONESIGNAL_APP_ID']

OneSignal.configure do |config|
  config.app_key = rest_api_key
end

api_instance = OneSignal::DefaultApi.new

notification = OneSignal::Notification.new({ app_id: app_id })
notification.contents = OneSignal::StringMap.new({ "en": 'English Message' })

begin
  notification_response = api_instance.create_notification(notification, included_segments: ['Active Users'])
  notification_id = notification_response.id
  p result
rescue OneSignal::ApiError => e
  puts "Error when calling DefaultApi->create_notification: #{e}"
end
