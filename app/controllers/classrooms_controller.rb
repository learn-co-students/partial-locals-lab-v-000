class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
  end

  def search
    @classroom = Classroom.find(params[:id])
  end
end
