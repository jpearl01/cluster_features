class Contig < ActiveRecord::Base
	belongs_to :strain, dependent: :destroy
end
