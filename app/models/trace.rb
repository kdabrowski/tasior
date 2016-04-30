class Trace < ActiveRecord::Base
  serialize :geo, JSON
end

