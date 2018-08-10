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

  def self.students_name
    @name_array = []
    self.class.all.each do |st|
      @name_array << st.name
    end 
    end 

  def self.search(name1)
    array1 = []
    self.all.each do |stud|
      st_nam = stud.name.downcase
      #st_nam = stud
    
      #binding.pry
      if st_nam.include?(name1)
        array1 << stud
      end
    end  
    array1
    #binding.pry
  end 

end
