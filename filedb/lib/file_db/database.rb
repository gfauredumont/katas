require 'json'

module FileDb
  class Database

    def initialize(data_file)
      file = File.read(data_file)
      @data = JSON.parse(file)
    end


    def table_names
      @data.keys.sort
    end

  end
end
