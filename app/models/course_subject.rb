class CourseSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject

  accepts_nested_attributes_for :subject

  # validates :course, presence: true
  validates :subject, presence: true
end