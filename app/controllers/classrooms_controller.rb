require 'pry'
class ClassroomsController < ApplicationController
  def show
    binding.pry
    @classroom = Classroom.find(params[:id])
    #@student = @classroom.oldest_student
  end

    #https://github.com/learn-co-curriculum/partial-locals-lab/issues/14
  #Temporary fix
=begin

<% @classroom.students.each do |student| %>
  <%= render partial: 'students/student', locals: {student: student} %>
  It doesn't work with just calling the partial alone
  @student isn't needed anymore.
  The partial is rendered for each student within the classroom.
<% end %>

=end

  def index
    @classrooms = Classroom.all
  end
end

=begin

#show.erb.html

Classroom Info
<p>
<%= @classroom.course_name %>
<%= @classroom.semester %>
</p>

We now want to call out the oldest student in the class:
<%= render 'students/student' %>
  

changed to

Classroom Info
<p>
  <%= render partial: "classrooms/classroom", locals: {classroom: @classroom} %>
</p>

We now want to call out the oldest student in the class:
<%= render partial: 'students/student', locals: {student: @student} %>



=end