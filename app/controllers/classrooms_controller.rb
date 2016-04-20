class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = Classroom.last.students
  end

  def index
    @classrooms = Classroom.all
  end
end


