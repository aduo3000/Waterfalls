class Waterfall < ActiveRecord::Base
	has_many :comments
	has_many :pictures
	validates :title, presence: true,
                    length: { minimum: 5 }
  has_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "200x200>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/     
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]            
end