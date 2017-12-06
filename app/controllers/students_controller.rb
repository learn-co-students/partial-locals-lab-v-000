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
  end

  def search
    if params[:student_name] = ''
      @students = Student.all
      redirect_to students_path(@students)
    else
      @students = Student.where(name: params[:student_name])
      redirect_to students_path(@students)
    end
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
