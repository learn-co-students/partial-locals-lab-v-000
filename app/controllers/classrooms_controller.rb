class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find_by(course_name: params[:course_name])
    @students = @classroom.students
  end

  def index
    @classrooms = Classroom.search(params[:course_name])
  end


end
