# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search)
    students = []
    Student.all.each do |student|
      students << student if student.name.downcase.include?(search.downcase) == true
    end
    students
  end
end


# <%= form_tag student_search_path do %>
#   <label> Search for a student: </label>
#   <%= text_field_tag :'search' %>
#   <%= submit_tag 'Search' %>
# <%end%>


# <li>
# Birthday: <%= student.birthday.strftime("%m/%d/%Y")  %>
# </li>
# <li>
# Hometown: <%= student.hometown.capitalize %>
# </li>