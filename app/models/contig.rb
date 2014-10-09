require 'bio'

class Contig < ActiveRecord::Base
	belongs_to :strain
	has_many :features, dependent: :destroy

	def import(bio_obj, s_id)
		self.strain_id = s_id
		self.name      = bio_obj.entry_id
		self.length    = bio_obj.seq_len
		self.sequence  = bio_obj.seq
		self.save!

		bio_obj.features.each_entry do |feat|
			next unless feat.feature != 'source'
			f = Feature.new
			f.import(feat, self.id)
		end

	end

end
