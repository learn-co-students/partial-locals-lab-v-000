class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students.all
    binding.pry
  end

  def index
    @classrooms = Classroom.all
  end
end
