class ClassroomsController < ApplicationController
   def index
    @classrooms = Classroom.all
  end

  def create
  end 


  def show
    @classroom = Classroom.find(params[:id])
    # @student = @classroom.oldest_student
  end

 
end
