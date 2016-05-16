class Staff < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   # Validations
   validates_presence_of :first_name, :last_name
   validate :date_validation


   def date_validation
     if self[:contract_expiration_date] == Date.today
       errors[:contract_expiration_date] << "Contract should at least be 1 day from today"
       return false
     else
       return true
     end
   end


   # Associations
   has_many :jobs
   has_many :projects, through: :jobs

   # Nested forms
   accepts_nested_attributes_for :projects
   accepts_nested_attributes_for :jobs

   #Mailboxer
   acts_as_messageable

   # Methods
   def to_s
     "#{self.first_name + " " + self.last_name }"
   end

   def name
     "#{self}"
   end

   def mailboxer_email(object)
      return nil
   end

   def contract_days_left
     (self.contract_expiration_date - Date.today).to_i
   end

end
