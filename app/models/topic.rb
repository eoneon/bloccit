class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }
  # scope :visible_to, -> (user) { user ? all : where(public: true) } - begs question, what does ":" do?
  # this would have worked also: (user) { user ? all : publicly_viewable }
  scope :visible_to, -> (user) { user ? all : self.publicly_viewable }
end
