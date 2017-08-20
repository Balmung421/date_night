require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/load'

class LoadTest < Minitest::Test

  attr_reader :loader

  def setup
    @loader = Load.new
  end

  def test_load_exists
    assert loader
  end

  def test_load_open_non_existent_file
    file_1 = Load.open_file("spec/does_not_exist.txt")
    assert_nil file_1
  end
  def test_load_short_list_file
    file_1 = Load.open_file("spec/movies_short.txt")
    assert file_1
  end
  def test_load_long_list_file
    file_1 = Load.open_file("spec/movies_long.txt")
    assert file_1
  end

  def test_load_retrieve_movies_list_short
    file_1 = Load.open_file("spec/movies_short.txt")
    list_1 = Load.retrieve_movies_list(file_1)
    assert_equal [[61, "The Shape of Voice"], [4, "Sunset Blood"], [92, "Sharknado 5"], [69, "I Love You, Man"]], list_1
  end
  def test_load_retrieve_movies_list_long
    file_1 = Load.open_file("spec/movies_long.txt")
    list_1 = Load.retrieve_movies_list(file_1)
    assert_equal 99, list_1.length
  end

end
