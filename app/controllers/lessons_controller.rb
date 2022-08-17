class LessonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @lesson = Lesson.find(params[:id])
    LessonView.create(lesson_id: @lesson.id, user_id: current_user.id)
    @lesson_counter = LessonView.where(lesson_id: @lesson).count
  end
end
