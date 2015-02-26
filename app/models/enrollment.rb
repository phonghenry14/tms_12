class Enrollment < ActiveRecord::Base
  before_save :set_default
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :course, class_name: 'Course', foreign_key: :course_id

  validates :user, presence: true
  #validates :course_id, presence: true
  private
  def set_default
    self.status = 0 if self.status.nil?
  end
end