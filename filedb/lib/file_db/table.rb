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

    def insert(entry_hash)
      entry_hash['id'] = max_id + 1
      @data << entry_hash
      entry_hash
    end

    private

      def max_id
        @data.max_by { |e| e['id'] }['id']
      end
  end
end
