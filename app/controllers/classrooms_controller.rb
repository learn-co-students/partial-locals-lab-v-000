class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    #@student = @classroom.oldest_student
    @all_students = Student.all
  end

  def index
    @classrooms = Classroom.all
  end
end
