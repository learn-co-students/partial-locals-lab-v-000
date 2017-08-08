class ClassroomsController < ApplicationController
  def show
    @students = Student.all
    @classroom = Classroom.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end
end
