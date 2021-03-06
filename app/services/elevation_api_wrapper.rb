class ElevationApiWrapper
  include HTTParty
  @@url = 'https://codingcontest.runtastic.com/api/elevations/bulk'

  attr_reader :trace

  def initialize(trace)
    @trace = trace
  end

  def add_elevations_to_trace
    @trace.geo.each_index { |i| @trace.geo[i][:elevation] = elevations[i] }
  end

  private

  def lat_and_long_from_trace
    @trace.geo.map { |hash| hash.reject { |key| key == :distance} }
  end

  def elevations
    JSON.parse(bulk_request.body)
  end

  def bulk_request
    HTTParty.post(@@url, :body => lat_and_long_from_trace.to_json, :headers => { 'Content-Typ' => 'application/json'} )
  end
end
