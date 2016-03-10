class ClassroomsController < ApplicationController
  def show
    @classroom = Classroom.find(params[:id])
    @student = @classroom.oldest_student
  end

  def index
    @classrooms = Classroom.all
    if params[:search]
      @classrooms = Classroom.search(params[:search]).order("created_at DESC")
    else
      @classrooms = Classroom.all.order('created_at DESC')
    end
  end

  end

end
