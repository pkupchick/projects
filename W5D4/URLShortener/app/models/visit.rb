
class Visit < ApplicationRecord
    def self.record_visit(user, shortened_url)
        Visit.new(:visitor_id => user.id, :url_id => shortened_url.id)
    end 
end