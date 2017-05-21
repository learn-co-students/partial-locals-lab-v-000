class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @classroom.oldest_student
  end


end
