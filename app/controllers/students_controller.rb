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
    @results = Student.all
    if params[:search_input] == nil || params[:search_input] == ""
      render 'index'
    else
      # params[:search_input] != "" && params[:search_input] != nil
      @results = Student.search(params[:search_input])
      # if @results == nil
      #   @results = Student.all
      # end
      render 'index'
    end
  end

  def student_params
    params.require(:student).permit(:name, :birthday, :hometown, :search_input)
  end
end
