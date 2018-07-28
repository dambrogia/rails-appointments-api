class Appointment < ApplicationRecord
  belongs_to :user
  has_many :guests, :dependent => :destroy

  validates_presence_of :date, :title, :notes
end
