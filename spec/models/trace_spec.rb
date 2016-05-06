require 'rails_helper'

RSpec.describe Trace, type: :model do
  # distance in two points betweend Gdansk and Gdynia ~12 km
 
  let!(:trace) { described_class.create(geo: [{latitude: 54.3520500, longitude: 18.6463700 }, {latitude: 54.51888980, longitude: 18.53054090 }]) }
  it 'calculates the distance bwetween two trace points'do
    trace.update_distances
    expect(trace.geo.last[:distance]).to eq(12432)
  end
end
