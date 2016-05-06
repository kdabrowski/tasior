class Trace < ActiveRecord::Base
  serialize :geo, Array

  validate :must_contain_hashes, :must_be_array, :must_have_correct_values

  def update_distances
    result_hash = self.geo
    result_hash.map.with_index { |element, index|  element[:"distance"] = sum_distance_between_points[index].round }
    self.update_attributes(geo: result_hash)
    self.save
  end

  private

  def must_be_array
     errors.add(:base, 'Must be an array') unless self.geo.is_a?(Array)
  end

  def must_contain_hashes
     errors.add(:base, 'Must contain hashes')  unless self.geo.all?{ |element| element.is_a?(Hash) }
  end

  def must_have_correct_values
     errors.add(:base, 'Hash must have latitude, longitude and flaot values') unless self.geo.all?{ |element| (contains_lat_and_long?(element) && valuse_floats?(element)) }
  end

  def contains_lat_and_long?(hash)
    hash.keys.to_s.include?("latitude" && "longitude")
  end

  def valuse_floats?(hash)
    hash[:latitude].is_a?(Float) && hash[:longitude].is_a?(Float)
  end

  def distance_between(point1, point2)
    Geocoder::Calculations.distance_between(point1, point2, :unit => :km)*1000
  end

  def calculate_distances
    result = []
    self.geo[1..-1].each_index { |i| result.push(distance_between([self.geo[i][:latitude], self.geo[i][:longitude]], [self.geo[i-1][:latitude], self.geo[i-1][:longitude]])) }
    result
  end

  def sum_distance_between_points
    result = [0]
    calculate_distances.map.with_index{|element,index| result.push(element + result[index]) }
    result
  end
end

