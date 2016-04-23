require 'pry'
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


  def self.search(n)
    if n.present?
      results = self.all.select do |s|
        s.name.downcase.include?(n.downcase)
      end
    else
      self.all
    end
  end


  # def self.search(name)
  #   if name.present?
  #     self.all.collect {|s| s if s.name.downcase.include?(name)}.compact
  #   else
  #     self.all
  #   end
  # end


end
