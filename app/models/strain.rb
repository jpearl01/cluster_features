require 'bio'

class Strain < ActiveRecord::Base
	has_many :contigs, dependent: :destroy
	has_many :features, through: :contigs

	def self.import(file)
		strain = new
		Bio::FlatFile.auto(ARGF) do |ff|
			ff.each do |entry|
        strain.length += entry.seq_len
        strain.contigs += 1
      end
    end
    strain.save!
	end
end

