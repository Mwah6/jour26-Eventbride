class Event < ApplicationRecord
  validate :start_date_cannot_be_in_the_past,
  :duration_multiple_of_five
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true

  belongs_to :administrator, class_name: "User"

  has_many :attendances
  has_many :users, through: :attendances

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def duration_multiple_of_five
    if duration.present? && (duration % 5 != 0 || duration < 0)
      errors.add(:duration, "doit être un multiple de 5 strictement positif")
    end
  end

  def end_date
    self.start_date + (self.duration * 60)
  end
end
