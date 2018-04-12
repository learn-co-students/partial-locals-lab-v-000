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
#3 binding.pry     observe the params[:query] which came from the form
#4 the || operator allows us to populate the @students variable with either result:
		@students = Student.search(params[:query]) || @students = Student.all
  end
 
	def student_params
#5 by the way....the params here are not affected, because we aren't creating a new student
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
