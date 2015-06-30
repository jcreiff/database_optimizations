class Assembly < ActiveRecord::Base
  has_many :sequences
  has_attached_file :uploaded_file
  validates_attachment_content_type :uploaded_file, :content_type => /\Aimage\/.*\Z/
end
