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
    assert_equal([@first_movie], @movies.select(where: { id: 1 }))
  end

  def test_select_where_director_id_1_returns_movies_1_2_4
    movies = @movies.select(where: { director_id: 1 })
    movies_ids = movies.map { |m| m["id"]}
    assert_equal([1, 2, 4], movies_ids)
  end

  def test_insert_returns_entry_with_encremented_id
    new_movie = { title: "Birds", year: 1962, director_id: 2 }
    assert({ "id" => 7, "title" => "Birds", "year" => 1962, "director_id" => 2 } == @movies.insert(new_movie))
    assert_equal(7, @movies.select.count)
  end

  def test_update_returns_updated_entry
    new_movie = { title: "Birds", year: 1962, director_id: 2 }
    @movies.insert(new_movie)
    updated_movie = { "id" => 7, "title" => "Birds", "year" => 1963, "director_id" => 2 }
    assert(updated_movie == @movies.update(where: { id: 7 }, values: { year: 1963 }))
  end

end
