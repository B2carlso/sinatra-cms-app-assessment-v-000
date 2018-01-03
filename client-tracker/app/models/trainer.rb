class Trainer < ActiveRecord::Base

  has_many :clients
  has_secure_password

   def slug
      username.downcase.gsub(" ", "-")
   end

   def self.find_by_slug(slug)
      Trainer.all.find do |trainer|
        trainer.slug == slug
      end
   end
end
