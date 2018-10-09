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
    if name.present?
      # where("NAME like ?", "%#{name}%")
      Student.all.select{|s|s.name.downcase.include?(name.downcase)}
    else
      self.all
    end
  end

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # def self.search(name:)
  #   if name:  
  #     @students = Student.all

  #   @students = Student.where("name LIKE :name", {:name => '%#{name}%'})
  #   where("age like ?", "some variable here")
  
  # end
end
