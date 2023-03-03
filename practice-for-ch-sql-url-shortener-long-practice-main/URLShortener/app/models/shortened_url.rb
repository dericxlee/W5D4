# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint           not null, primary key
#  short_url    :string           not null
#  long_url     :string           not null
#  submitter_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    validates :long_url, presence: true, uniqueness: true
    validates :submitter_id, presence: true



    def self.random_code
        short = SecureRandom::urlsafe_base64
        short
    end
    
    # def self.create(long_url, submitter_id)
    #     short = ShortenedUrl.random_code
    #     ShortenedUrl.create!(short_url: short, long_url: long_url, submitter_id: submitter_id)
    # end

    after_initialize do |shortenedurl|
        self.short_url = self.generate_short_url
    end

    private
    def generate_short_url
        short = ShortenedUrl.random_code
        until !ShortenedUrl.exists?(:short_url => short)
            short = SecureRandom::urlsafe_base64
        end
        short
    end

end
