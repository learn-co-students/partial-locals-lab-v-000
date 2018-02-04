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
  #Add in search functionality such that users can search for a student by name
  #and see all matching results on the students index page.
    #@students = Student.all
    #@students = Student.all.count
    #@students = Student.search.count
    #@students = Student.search.all.count
    @students = Student.where(:name)
      students/_student.html.erb
  end

  #def search
    #@students = Student.all.count
  #end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
