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
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    #sets @students based on whether search term provided
    #goes to model and runs #search method
    @students = Student.search(params[:query])
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
