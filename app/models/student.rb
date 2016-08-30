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


  # def self.search(query)
  #   if self.where("name like ?", "%#{query}%").present?
  #      where("name like ?", "%#{query}%")
  #   else 
  #      self.all
  #   end 
  # end

   def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end


end


# <%= form_tag students_path, method: "get", id: "search-form" do %>
# <%= text_field_tag :query, params[:query] %>
# <%= submit_tag "Search" %>
# <% end %>


# <% if @students.present? %>

# <% @student_names do |student| %>

# <%= render partial: 'student', locals: {student: student} %> 

# <% end %>

# <% end %>