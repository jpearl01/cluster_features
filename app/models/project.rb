class Project < ActiveRecord::Base
	has_many :strains, dependent: :destroy
end
