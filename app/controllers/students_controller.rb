class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def index
    binding.pry
    @students = Student.search(params[:search_term])
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
