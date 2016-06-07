class User < ActiveRecord::Base
  after_initialize :give_standard_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaborators
  has_many :wikis, through: :collaborators

  validates :role, presence: true

  enum role: [:standard, :premium, :admin]

  def collaborates_on(wiki_id)
    collaborators.where(wiki_id: wiki_id).first
  end

  private
  def give_standard_role
    self.role ||= :standard
  end
end
