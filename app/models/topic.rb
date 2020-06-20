class Topic < ApplicationRecord
    validates :title, presence: true
    has_many :blogs
    def self.own_blogs
        includes(:blogs).where.not(blogs: {id: nil})
    end
end
