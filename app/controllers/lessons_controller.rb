class LessonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @lesson = Lesson.find(params[:id])
    @comment = Comment.new
    @comments = Comment.by_lesson(@lesson)
    @lesson_counter = LessonView.where(lesson_id: @lesson).count 
    LessonView.create(lesson_id: @lesson.id, user_id: current_user.id)
  end

end
