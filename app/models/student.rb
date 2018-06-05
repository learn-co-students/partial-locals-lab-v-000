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

  def self.search(search_query)
    if search_query.present?
      where('NAME like ?', "%#{search_query}%")
    else
      self.all
    end
  end
end

# NAME? Does capitalization matter? like? Why is like used at all? How can I see the SQL involved?