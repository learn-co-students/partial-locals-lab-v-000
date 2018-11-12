class StudentsController < ApplicationController
  def new
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
    @student = Student.find(params[:id])
  end

  def index
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
