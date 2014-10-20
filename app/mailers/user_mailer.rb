class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def event_notification(event)
    @event = event
    # CR use an environment variable - don't hard code your address  (use .env  https://github.com/bkeepers/dotenv make sure to put in your .getignore)

    mail(to: 'andrew.mcclellan3@gmail.com', subject: "New Event Submitted")
  end

end
