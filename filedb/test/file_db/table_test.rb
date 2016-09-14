require 'test_helper'

class FileDb::TableTest < Minitest::Test

  def setup
    db = FileDb::Database.new('fixtures/data.json')
    @movies = db.table("movies")
    @first_movie = {
      "id" => 1,
      "title" => "The Gold Rush",
      "year" => 1925,
      "director_id" => 1
    }
  end

  def test_select_returns_items_collection
    assert_kind_of(Array, @movies.select)
  end

  def test_select_first_returns_first_movie
    assert_equal(@first_movie, @movies.select.first)
  end

  def test_select_where_id_1_returns_first_movie
    assert_equal(@first_movie, @movies.select(where: { id: 1 }))
  end

end
