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
  
  def self.search(findme)
    if findme == ''
      self.all
    else
      # arr.select {|s| s.include? 'sa'}
      self.all.select { |s| s.name.downcase.include?(findme) }
    end
  end
end
