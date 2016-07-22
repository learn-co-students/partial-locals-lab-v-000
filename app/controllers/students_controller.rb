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
    @students = Student.all
    if params[:name]
      @students = Student.search(params[:name])
    else
      @students = Student.all
    end
  end

  def search
    @student = Student.find_by(:name)
    redirect_to students_path(@student)
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
