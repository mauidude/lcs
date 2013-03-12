class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, 
                  :password_confirmation, 
                  :remember_me,
                  :first_name, 
                  :last_name

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false, message: "has already been registered" },
            email: true,
            length: { maximum: 100 }

  validates :password,
            presence: true,
            confirmation: true,
            length: { minimum: 8, maximum: 15 },
            if: :validate_password?

  validates :first_name,
            presence: true,
            length: { maximum: 20 }

  validates :last_name,
            presence: true,
            length: { maximum: 20 }

  def name
    "#{first_name} #{last_name}"
  end

  private

    def validate_password?
      new_record? || !password.nil?
    end
end
