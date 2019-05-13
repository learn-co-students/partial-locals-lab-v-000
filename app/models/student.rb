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
  validates :name, presence: true


  def self.search(student_params = "")
    return Student.all.map {|s| s.name} if student_params == ""
    #Student.where('UPPER(name) LIKE ?', "UPPER('%#{student_params}%')")
  #  binding.pry
    Student.all.select {|s| s.name.downcase.include?(student_params)}
  end

end
