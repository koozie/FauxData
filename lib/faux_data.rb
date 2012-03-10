


module FauxData
    VERSION = "1.0.0".freeze if not defined?(FauxData::VERSION)
end

require File.join(File.dirname(__FILE__),'faux_data','person_generator')

