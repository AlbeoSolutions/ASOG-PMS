class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name

   has_many :jobs
   has_many :projects, through: :jobs

   accepts_nested_attributes_for :projects
   accepts_nested_attributes_for :jobs

   def to_s
     "SWAGGG"
   end
end
