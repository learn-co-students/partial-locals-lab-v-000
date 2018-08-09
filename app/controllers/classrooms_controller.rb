class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @classroom.students.oldest_student
    binding.pry

  end

  def index
    @classrooms = Classroom.all
  end
end
