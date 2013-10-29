class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # attr_accessible :title, :body
  attr_accessible :fname, :lname, :email, :password, :password_confirmation, :username, :remember_me, :uid
  validates_presence_of :username, :presence => { :message => "Username cannot be blank" }
  validates_uniqueness_of :username, :presence => { :message => "Username taken, please choose another" }
  has_many :posts, :dependent => :destroy
  
end
