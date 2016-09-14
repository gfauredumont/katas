require 'pry'
module FileDb
  class Table
    def initialize(data)
      @data = data
    end

    def select(where: nil)
      return @data unless where && where.keys.first
      key = where.keys.first
      @data.select{ |v| v[key.to_s] == where[key]}
    end
  end
end
