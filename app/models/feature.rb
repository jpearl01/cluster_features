class Feature < ActiveRecord::Base
	belongs_to :contig

	def import(feat_obj, c_id)
		self.contig_id = c_id
		self.type      = feat_obj.feature
		#It should be noted all this stuff on locations will only work on genes w/o intron/exons
		self.strand    = feat_obj.locations.locations[0].strand
		self.start     = feat_obj.locations.locations[0].from
		self.end       = feat_obj.locations.locations[0].to
		self.length    = feat_obj.locations.length
		self.sequence  = feat_obj.assoc['translation']
		self.annotation= feat_obj.assoc['product']
		self.save!

	end
end
