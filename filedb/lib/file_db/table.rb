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
      entry_hash = entry_hash.inject({}) { |memo, (k,v)| memo[k.to_s] = v; memo}
      @data << entry_hash
      entry_hash
    end

    def update(where: {}, values: {})
      entry = select(where: where).first
      value_key = values.keys.first
      entry[value_key.to_s] = values[value_key]
      entry
    end

    private

      def max_id
        @data.max_by { |e| e['id'] }['id']
      end
  end
end
