class Attendance < ApplicationRecord
    after_create :welcome_event_send
  belongs_to :user
  belongs_to :event

  def welcome_event_send
    AttendanceMailer.welcome_event_email(self).deliver_now
  end
end
