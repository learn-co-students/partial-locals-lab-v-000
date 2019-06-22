class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @classroom.oldest_student
    @classrooms = Classroom.all
  end

  def index
    @classrooms = Classroom.all
  end
end
