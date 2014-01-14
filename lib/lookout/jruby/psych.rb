# This hack is required because YAML is all kinds of messed up and incompatible
# with our version of Configatron under JRuby
module Psych
  module Yecht
    MergeKey = nil
  end
end
