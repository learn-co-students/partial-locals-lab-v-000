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
  validates :hometown, presence: true
  validates :birthday, presence: true
  
  def self.search(query)
    if query.blank?
      self.all
      #self.all.map {|student| student.name}
    else
      where('NAME like ?', "%#{query}%")
      #self.all.select {|student| student.name if student.name.downcase.include?(query.downcase)}
    end
  end
end