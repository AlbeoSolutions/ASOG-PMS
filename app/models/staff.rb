class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # Validations
   validates_presence_of :first_name, :last_name

   # Associations
   has_many :jobs
   has_many :projects, through: :jobs

   # Nested forms
   accepts_nested_attributes_for :projects
   accepts_nested_attributes_for :jobs

   # Methods
   def to_s
     "#{self.first_name + " " + self.last_name }"
   end

end
