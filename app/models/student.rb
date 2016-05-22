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


  def self.search(name_array)
    if name_array == ""
      Student.all
    elsif !name_array.kind_of?(Array)
        Student.where('name like ?', "%#{name_array}%")
    else
    s.collect do |name|
        name if Student.where('name like ?', "%#{name}%")
    end

      


     end
  end
end
