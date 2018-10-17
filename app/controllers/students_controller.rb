require 'pry'
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
    #@search = Student.search(params[:term]) unless params[:term] == nil
    if params[:term] == nil
      @students = Student.all
    else
      @students = Student.search(params[:term])
    end
    #@search
    #binding.pry
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end
