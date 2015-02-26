class Admin::EnrollmentsController < ApplicationController
  def new
    @course = Course.find params[:course_id]
    @enrollment = @course.enrollments.new
    @users = User.all
  end
end