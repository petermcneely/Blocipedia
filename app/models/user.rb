class User < ActiveRecord::Base
  after_initialize :give_standard_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  validates :email, presence: true
  validates :password, presence: true
  validates :role, presence: true

  enum role: [:standard, :premium, :admin]

  private
  def give_standard_role
    self.role ||= :standard
  end
end
