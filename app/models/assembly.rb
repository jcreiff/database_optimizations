class Assembly < ActiveRecord::Base
  has_many :sequences
  has_one :report
end
