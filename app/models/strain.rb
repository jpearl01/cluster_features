require 'bio'

class Strain < ActiveRecord::Base
	belongs_to :project
	has_many :contigs, dependent: :destroy
	has_many :features, through: :contigs

	def import(file)
		self.length = 0
		self.contig_num = 0
		self.name = File.basename(file.original_filename, File.extname(file.original_filename))
		self.species = 'species'
		self.genus   = 'Missing'
		self.save!
		Bio::FlatFile.auto(file.path) do |ff|
			ff.each do |entry|
				ctg = Contig.new
				ctg.import(entry, self.id)
        self.length += entry.seq_len
        self.contig_num += 1
      end
    end

		name_features(get_all_features)

    self.save!
	end


	protected

	def name_features(features)
		count = 1
		features.each do |f|
			f.name = self.name + "_" + count.to_s
			f.save
			count += 1
		end
	end

	def get_all_features
		self.contigs.each.inject([]) {|memo, c| memo.concat(c.features)}
	end

end

