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


  def self.search(query)
    if query == ''
      Student.all
    else
      Student.all.select do |list|
        # binding.pry
        list.name.downcase.include?(query.to_s)
      end
    end
  end


end
