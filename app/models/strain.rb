class Strain < ActiveRecord::Base
	has_many :contigs
	has_many :features, through: :contigs
end
