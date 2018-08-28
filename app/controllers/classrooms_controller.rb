class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
<<<<<<< HEAD
=======
binding.pry    
    # @students = Student.all
>>>>>>> 41bfddab7b107ef168d340e936416d377e0d3da3
  end

  def index
    @classrooms = Classroom.all
  end
end
