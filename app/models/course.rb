class Course < ActiveRecord::Base
  has_many :enrollments, class_name: 'Enrollment',
                         foreign_key: 'course_id',
                         dependent: :destroy
  has_many :users, through: :enrollments
  has_many :course_subjects, class_name: 'CourseSubject',
                             foreign_key: 'course_id',
                             dependent: :destroy
  has_many :subjects, through: :course_subjects

  accepts_nested_attributes_for :enrollments, allow_destroy: true
  accepts_nested_attributes_for :course_subjects, allow_destroy: true

  validates :content, presence: true, length: {maximum: 140}
  validates :name, presence: true, length: {maximum: 50}

  def user_course_id user
    Enrollment.where(course: self, user: user).first.try :id
  end

  def subject_course_id subject
    CourseSubject.where(course: self, subject: subject).first.try :id
  end
end