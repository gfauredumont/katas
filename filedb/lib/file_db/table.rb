module FileDb
  class Table
    def initialize(data)
      @data = data
    end

    def select(where: nil)
      if where
        @data.first
      else
        @data
      end
    end

  end
end
