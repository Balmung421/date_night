require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/sort'
require './lib/node'

class SortTest < Minitest::Test

	def test_multiple_objects
		nodes = []
		movie_data = [
			[61, "The Shape of Voice"],
			[73, "I'll Be Here" ],
			[84, "Giantbomb"],
			[87, "Birdman"],
			[92, "Sharknado 5"]
		]
		movies_shuffled = movie_data.shuffle
		movies = []
		movies_shuffled.each do |movie_rating, movie_title|
			node = Node.new(movie_rating, movie_title)
			movies.push(node)
		end
		movies = Sort.insertion_sort(movies)
		(movie_data.length).times do |i|
			assert_equal movies[i].movie_rating, movie_data[i][0]
			assert_equal movies[i].movie_title, movie_data[i][1]
		end
	end

end
