class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @classroom.oldest_student
    @students = Student.all
  #  binding.pry
  end

  def index
    @classrooms = Classroom.all
  end
end
