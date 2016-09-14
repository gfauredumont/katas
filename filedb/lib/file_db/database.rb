require 'json'

module FileDb
  class Database

    def initialize(data_file)
      file = File.read(data_file)
      @data = JSON.parse(file, {symbolized_names: true})
    end


    def table_names
      @data.keys.sort
    end

    def table(table_name)
      FileDb::Table.new(@data[table_name])
    end
  end
end
