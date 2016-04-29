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

  # this method works:

  # def self.search(student)
  #   @students = []
  #   if student.blank?
  #     self.all
  #   else
  #     self.all.map do |s|
  #       if s.name.downcase.include?(student.downcase)
  #         @students << s
  #       end
  #     end
  #     @students
  #   end
  # end

  # this method is better:
  def self.search(search)
    # example: SELECT "students".* FROM "students" WHERE (name LIKE '%cris%')
    if search.present?
      self.where("name LIKE ?", "%#{search}%") 
    else
      self.all
    end
  end

end
