class Strain < ActiveRecord::Base
	has_many :features, through: :contigs
end
