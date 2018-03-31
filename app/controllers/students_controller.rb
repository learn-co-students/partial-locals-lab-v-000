class StudentsController < ApplicationController
  skip_before_filter :verify_authenticity_token

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

  def search
    #raise params.inspect
    @results = Student.search(search_params[:name])
    render :index
  end

  def edit
    @student = Student.find(params[:id])
  end

  def show
    @student = Student.find(params[:id])
  end

  def index
    @students = Student.all
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end

  def search_params
    params.require(:student).permit(:name)
  end
end
