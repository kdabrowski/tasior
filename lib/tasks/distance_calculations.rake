namespace :distance_calculations do
  desc "It updates distances for all the traces that don't have any distances saved"
  task update_distances: :environment do
    traces_without_distances = Trace.all.select { |trace_model| trace_model.geo.all? {|geo_info| !geo_info.include?(:distance)} }
    traces_without_distances.each { |e| e.update_distances  }
  end

end
