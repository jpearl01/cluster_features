class Feature < ActiveRecord::Base
	belongs_to :contig

	def import(feat_obj, c_id, curr_count)
		self.name      = get_gene_name(c_id, curr_count)
		self.contig_id = c_id
		self.f_type    = feat_obj.feature
		#It should be noted all this stuff on locations will only work on genes w/o intron/exons
		self.strand    = feat_obj.locations.locations[0].strand
		self.start     = feat_obj.locations.locations[0].from
		self.end       = feat_obj.locations.locations[0].to
		self.length    = feat_obj.locations.length
		self.sequence  = feat_obj.assoc['translation']
		self.annotation= feat_obj.assoc['product']
		self.save!

	end

protected
	#takes the contig id, gets the current number of features associated with the strain, increments it and returns a new feature name
	#May not work
	def get_gene_name(c_id, curr_count)
#		count = Strain.find(Contig.find(c_id).strain_id).contigs.inject(0) {|sum, n| sum + n.features.count}
#		Strain.find(Contig.find(c_id).strain_id).name + "_" + count.to_s
	curr_count += 1
	Strain.find(Contig.find(c_id).strain_id).name + "_" + curr_count.to_s
	end
end
