class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @studen.find(params[:id])
  end

  def index
    @classrooms = Classroom.all
  end
end
