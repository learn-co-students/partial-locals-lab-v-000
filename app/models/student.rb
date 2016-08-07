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
require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students
  validates_presence_of :name, :hometown, :birthday
  
#returns array with matching students by name
def self.search(name_input)
  self.all unless name_input.present?
  where(['NAME like ?', "%#{name_input}%"])
end


end
