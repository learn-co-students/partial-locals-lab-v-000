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
    @students = Student.all
    if params[:search]
      if Student.search(params[:search]).nil? || Student.search(params[:search]).empty?
        @students = Student.all
      else
        @students = Student.search(params[:search])
      end
    end
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown, :search)
  end
end
