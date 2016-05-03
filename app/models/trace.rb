class Trace < ActiveRecord::Base
  serialize :geo, Array 
end

