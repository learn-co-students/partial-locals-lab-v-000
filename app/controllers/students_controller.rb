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
    @students = Student.all
    Student.search(params[:search])
    render 'index'


    # if !params[:search].blank?
    #    @students = Student.search('rob').map {|s| s.name} 
    #    # if @student != nil
    #    #   redirect_to student_path(@student)
    #    # end
    #  else
    #   Student.all
    # end


    # if params[:search].blank?
    #   @students = Student.all
    #   redirect_to students_path
    # end
    
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
