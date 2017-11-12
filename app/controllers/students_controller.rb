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

  def search
    # byebug
    Student.search(params[:name])
    redirect_to students_path
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
    @search_results = Student.search_results
  end



  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
