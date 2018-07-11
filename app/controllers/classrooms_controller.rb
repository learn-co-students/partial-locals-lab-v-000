class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find_by(id: params[:id])
    @students = @classroom.students.all
  end

  def index
    @classrooms = Classroom.search(params[:course_name])

  end


end
