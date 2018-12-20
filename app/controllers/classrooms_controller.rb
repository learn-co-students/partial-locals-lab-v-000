class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    # @student = @classroom
  end

  def index
    @classrooms = Classroom.all
  end
end
