class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user #its creator
  has_many :collaborators
  has_many :users, through: :collaborators

  validates_presence_of :title, :slug, :body, :user

  scope :public_wikis, -> { where(private: false) }
  scope :visible_to, -> (user) { user ? all : public_wikis }

  def public?
    !private
  end

  def owner
    user
  end
end
