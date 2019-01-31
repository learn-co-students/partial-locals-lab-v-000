class StudentsController < ApplicationController


  def index
    @students = Student.all
  end

#  def search
#    if Students.search.map {|s| s.name } == ""
#      Student.all
#    else
#      render students_path(index)
#    end
#  end

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


  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
