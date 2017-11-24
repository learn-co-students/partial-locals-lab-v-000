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
    current_student
  end

  def show
    current_student
  end

  def index
    @students = Student.all
  end

  private

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

  def current_student
    @student = Student.find(params[:id])
  end
end
