class Wiki < ActiveRecord::Base
  belongs_to :user #its creator
  has_many :collaborators
  has_many :users, through: :collaborators

  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

  scope :public_wikis, -> { where(private: false) }
  scope :visible_to, -> (user) { user ? all : public_wikis }

  def public?
    !private
  end

  def owner
    user
  end
end
