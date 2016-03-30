class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
  binding.pry
    @students = @classroom.students
  end

  def index
    @classrooms = Classroom.all
  end
end
