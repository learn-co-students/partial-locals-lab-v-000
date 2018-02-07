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
    @students = Student.search(params[:term])
    
    # # @student = Student.search(params[:term])
    # @students = Student.all
      # if params[:term]
      #   @students = Student.search(params[:term])
      # else 
      #   @students = Student.all
      # end 
   #ask for help on this. 
  end


 # could be:     .order("created_at DESC")


  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
