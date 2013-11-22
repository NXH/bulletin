class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categories
  has_many :events
  has_many :tasks

  validates :nickname, :presence => true
  validates :person1, :presence => true
  validates :person2, :presence => true
  validates :encrypted_password, :presence => true
  validates :email, :presence => true

end
