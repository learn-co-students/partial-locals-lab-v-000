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

  def self.search(search_name)
    if search_name.empty? || search_name.nil?
      Student.all
    else
      #Student.all.collect { |s| s if s.name.downcase.include? search_name.downcase }
      search_name.insert(0, "%").insert(-1, "%") #turn this into a fuzzy search - so %joe%
      Student.where('name LIKE ?', search_name).all
    end
  end
end
