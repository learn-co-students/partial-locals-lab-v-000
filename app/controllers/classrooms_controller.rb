class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.student.all
  end

  def index
    @classrooms = Classroom.all
  end
end
