class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    # @student = @classroom.oldest_student
    @students = Student.all
  end

  def index
    @classrooms = Classroom.all
  end
end
