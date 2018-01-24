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
    if params[:q]
      @students = Student.search(params[:q])
    else
      @students = Student.all
    end
    # on the first load of the index page, params[:q] will be empty
    # to account for this, we check if params[:q] exists
    # when it does exist, run the search method
    # if it doesn't, then just return a list of all the existing students
    # must take into account all the different situations (esp if something might be nil)!!
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
