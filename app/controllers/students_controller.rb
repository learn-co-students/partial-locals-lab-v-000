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
#    if params[:name]
#      @student = Student.where('name LIKE ?', "%#{params[:name]}%")
#    else
      if params[:name].nil?
        @students = Student.search("")
      else
        @students = Student.search(params[:name])
      end
    #  binding.pry
#    end
  end


  def student_params
  #  binding.pry
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
