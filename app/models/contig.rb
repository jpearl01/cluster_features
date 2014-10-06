class Contig < ActiveRecord::Base
	belongs_to :strain
	has_many :features, dependent: :destroy
end
