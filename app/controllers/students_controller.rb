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
    # binding.pry
    @students = Student.all
    @name_text = params[:name_text]
    binding.pry
    # @name_text =
    # @student = Student.search(name_text)
  end

  def student_params
    binding.pry
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
