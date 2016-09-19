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
    #@students = Student.all
    @students = Student.search(params[:query]) #if no search query, then it will return all students
    render 'index' #this way the search form in the index page can call index route again to search
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
