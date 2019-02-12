class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @students = Student.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end
end
