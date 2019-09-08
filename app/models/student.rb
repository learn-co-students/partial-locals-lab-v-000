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

  def self.search(name)
    search=Student.all.find_all{|st| st.name.downcase.include?(name)}
    #binding.pry
    if search.empty?
      return Student.all
    else
      return search
    end
  end
end
