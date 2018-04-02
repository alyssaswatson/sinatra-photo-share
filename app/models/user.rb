class User < ActiveRecord::Base
  has_many :photos
  has_secure_password

  def slug
    username.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
