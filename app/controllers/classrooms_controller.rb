class ClassroomsController < ApplicationController
  def show
    binding.pry
    @classroom = Classroom.find(params[:id])
    if @classroom

    else
      errors.add(:classroom, "No such a classroom here")
    end
  end

  def index
    @classrooms = Classroom.all
  end
end
