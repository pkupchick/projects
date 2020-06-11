require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true

    def self.random_code
        token = SecureRandom.urlsafe_base64
        ShortenedUrl.exists?(token) ? ShortenedUrl.random_code : token 
    end 

    def create_short_url(user, long_url)
        ShortenedUrl.create!(:short_url => ShortenedUrl.random_code, :long_url => long_url, :user_id => user.id)
    end 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: 'User',
        optional: true
end