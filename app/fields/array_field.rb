require "administrate/fields/base"

class ArrayField < Administrate::Field::Base
  def to_s
    data
  end
end
