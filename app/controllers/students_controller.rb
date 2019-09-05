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
  end
=begin
 Index iterates through students
<% @students.each do |student| %>
  <%= render partial: 'student', locals: {student: student} %>
<% end %>
=end

  #no index page was given originally
  def student_params
    params.require(:student).permit(:name, :birthday, :hometown)
  end
end

=begin
# _form.html.erb

<%= form_for @student do |f|%>
<p>
  <%= f.label :name %>
  <%= f.text_field :name %>
</p>
<p>
  <%= f.label :hometown %>
  <%= f.text_field :hometown %>
</p>
<p>
  <%= f.label :birthday %>
  <%= f.date_field :birthday %>
</p>
  <%= f.submit %>
<% end %>

changed to 

<%= form_for classroom_student do |f|%>
<p>
  <%= f.label :name %>
  <%= f.text_field :name %>
</p>
<p>
  <%= f.label :hometown %>
  <%= f.text_field :hometown %>
</p>
<p>
  <%= f.label :birthday %>
  <%= f.date_field :birthday %>
</p>
  <%= f.submit %>
<% end %>

#new.html.erb and edit.html.erb
  <%= render 'form' %>

  changed to 

  <%= render partial: "form", locals: {student: @student} %>

#_student.html.erb
<ul>
  <li>
    Name: <%= @student.name %>
  </li>
  <li>
    Birthday: <%= @student.birthday.strftime("%m/%d/%Y")  %>
  </li>
  <li>
    Hometown: <%= @student.hometown.capitalize %>
  </li>
</ul>

changed to 

<ul>
  <li>
    Name: <%= student.name %>
  </li>
  <li>
    Birthday: <%= student.birthday.strftime("%m/%d/%Y")  %>
  </li>
  <li>
    Hometown: <%= student.hometown.capitalize %>
  </li>
</ul>

#show.html.erb
<h1>Student Info</h1>

<%= render 'student' %>

changed to 

  <%= render partial: "students/student", locals: {student: @student} %>
=end

