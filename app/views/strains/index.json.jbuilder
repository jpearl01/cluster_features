json.array!(@strains) do |strain|
  json.extract! strain, :id, :name, :length, :contig_num, :genus, :species
  json.url strain_url(strain, format: :json)
end
