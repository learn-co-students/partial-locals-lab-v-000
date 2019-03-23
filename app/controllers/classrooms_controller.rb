class ClassroomsController < ApplicationController
  def show

  end

  def index
    @classrooms = Classroom.all
  end
end
