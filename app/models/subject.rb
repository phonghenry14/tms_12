class Subject < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :course_subjects, class_name: 'CourseSubject',
                             foreign_key: 'subject_id',
                             dependent: :destroy
  has_many :course, through: :course_subjects

  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :name, presence: true, uniqueness: true
end 