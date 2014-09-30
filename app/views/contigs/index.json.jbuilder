json.array!(@contigs) do |contig|
  json.extract! contig, :id, :name, :length, :sequence
  json.url contig_url(contig, format: :json)
end
