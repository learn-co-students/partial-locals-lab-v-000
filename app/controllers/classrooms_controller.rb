class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @students = @classroom.students.all
  end

  def index
    @classrooms = Classroom.all
  end
end
