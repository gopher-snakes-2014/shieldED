class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def event_notification(event)
    @event = event
    mail(to: 'andrew.mcclellan3@gmail.com', subject: "New Event Submitted")
  end

end
