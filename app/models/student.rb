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

#found #search method in stackoverflow, adapted
# for list of all names if blank input in form -
# the else portion.

  def self.search(search)
      if search.present?
        where('NAME like ?', "%#{search}%")
      else
        self.all
      end
  end

end
