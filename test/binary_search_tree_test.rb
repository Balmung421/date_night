require 'minitest/autorun'
require 'minitest/pride'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test

  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

	def test_exists
		assert tree
	end

	def test_insert_has_correct_output_after_first_insert
		insert_1 = tree.insert(61, "The Shape of Voice")
		assert_equal insert_1, 0
	end

	def test_insert_has_correct_output_after_second_insert
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(16, "Johnny English")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
	end

	def test_insert_has_correct_output_after_third_insert
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(16, "Johnny English")
		insert_3 = tree.insert(92, "Sharknado 5")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
		assert_equal insert_3, 1
	end

	def test_insert_has_correct_output_after_five_lower
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(16, "Johnny English")
		insert_3 = tree.insert(10, "Your Name")
		insert_4 = tree.insert(7, "When Harry Met Sally")
		insert_5 = tree.insert(4, "Sunset Blood")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
		assert_equal insert_3, 2
		assert_equal insert_4, 3
		assert_equal insert_5, 4
	end

	def test_insert_has_correct_output_after_five_zig_zag_lower
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(4, "Sunset Blood")
		insert_3 = tree.insert(16, "Johnny English")
		insert_4 = tree.insert(7, "When Harry Met Sally")
		insert_5 = tree.insert(10, "Your Name")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
		assert_equal insert_3, 2
		assert_equal insert_4, 3
		assert_equal insert_5, 4
	end

	def test_insert_has_correct_output_after_five_higher
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(73, "I'll Be Here")
		insert_3 = tree.insert(84, "Giantbomb")
		insert_4 = tree.insert(87, "Birdman")
		insert_5 = tree.insert(92, "Sharknado 5")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
		assert_equal insert_3, 2
		assert_equal insert_4, 3
		assert_equal insert_5, 4
	end

	def test_insert_has_correct_output_after_five_zig_zag_higher
		insert_1 = tree.insert(61, "The Shape of Voice")
		insert_2 = tree.insert(92, "Sharknado 5")
		insert_3 = tree.insert(73, "I'll Be Here")
		insert_4 = tree.insert(87, "Birdman")
		insert_5 = tree.insert(84, "Giantbomb")
		assert_equal insert_1, 0
		assert_equal insert_2, 1
		assert_equal insert_3, 2
		assert_equal insert_4, 3
		assert_equal insert_5, 4
	end

	def test_include_has_correct_output_after_zero_inserts
		include_1 = tree.include?(61)
		include_2 = tree.include?(16)
		include_3 = tree.include?(92)
		assert_equal include_1, false
		assert_equal include_2, false
		assert_equal include_3, false
	end

	def test_include_has_correct_output_after_first_insert
		tree.insert(61, "The Shape of Voice")
		include_1 = tree.include?(61)
		include_2 = tree.include?(16)
		include_3 = tree.include?(92)
		assert_equal include_1, true
		assert_equal include_2, false
		assert_equal include_3, false
	end

	def test_include_has_correct_output_after_second_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		include_1 = tree.include?(61)
		include_2 = tree.include?(16)
		include_3 = tree.include?(92)
		assert_equal include_1, true
		assert_equal include_2, true
		assert_equal include_3, false
	end

	def test_include_has_correct_output_after_third_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(92, "Sharknado")
		include_1 = tree.include?(61)
		include_2 = tree.include?(16)
		include_3 = tree.include?(92)
		assert_equal include_1, true
		assert_equal include_2, true
		assert_equal include_3, true
	end

	def test_max_has_correct_output_after_zero_inserts
		max_rating = tree.max
		assert_equal max_rating, {}
	end

	def test_max_has_correct_output_after_first_insert
		tree.insert(61, "The Shape of Voice")
		max_rating = tree.max
		assert_equal max_rating, {"The Shape of Voice" => 61}
	end

	def test_max_has_correct_output_after_second_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		max_rating = tree.max
		assert_equal max_rating, {"The Shape of Voice" => 61}
	end

	def test_max_has_correct_output_after_third_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(92, "Sharknado 5")
		max_rating = tree.max
		assert_equal max_rating, {"Sharknado 5" => 92}
	end

	def test_max_has_correct_output_after_five_higher
		tree.insert(61, "The Shape of Voice")
		tree.insert(73, "I'll Be Here")
		tree.insert(84, "Giantbomb")
		tree.insert(87, "Birdman")
		tree.insert(92, "Sharknado 5")
		max_rating = tree.max
		assert_equal max_rating, {"Sharknado 5" => 92}
	end

	def test_max_has_correct_output_after_five_zig_zag_higher
		tree.insert(61, "The Shape of Voice")
		tree.insert(92, "Sharknado 5")
		tree.insert(73, "I'll Be Here")
		tree.insert(87, "Birdman")
		tree.insert(84, "Giantbomb")
		max_rating = tree.max
		assert_equal max_rating, {"Sharknado 5" => 92}
	end

	def test_max_has_correct_output_after_five_lower
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(10, "Your Name")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(4, "Sunset Blood")
		max_rating = tree.max
		assert_equal max_rating, {"The Shape of Voice" => 61}
	end

	def test_max_has_correct_output_after_five_zig_zag_lower
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(10, "Your Name")
		max_rating = tree.max
		assert_equal max_rating, {"The Shape of Voice" => 61}
	end

	def test_min_has_correct_output_after_zero_inserts
		min_rating = tree.min
		assert_equal min_rating, {}
	end

	def test_min_has_correct_output_after_first_insert
		tree.insert(61, "The Shape of Voice")
		min_rating = tree.min
		assert_equal min_rating, {"The Shape of Voice" => 61}
	end

	def test_min_has_correct_output_after_second_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		min_rating = tree.min
		assert_equal min_rating, {"Johnny English" => 16}
	end

	def test_min_has_correct_output_after_third_insert
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(92, "Sharknado 5")
		min_rating = tree.min
		assert_equal min_rating, {"Johnny English" => 16}
	end

	def test_min_has_correct_output_after_five_higher
		tree.insert(61, "The Shape of Voice")
		tree.insert(73, "I'll Be Here")
		tree.insert(84, "Giantbomb")
		tree.insert(87, "Birdman")
		tree.insert(92, "Sharknado 5")
		min_rating = tree.min
		assert_equal min_rating, {"The Shape of Voice" => 61}
	end

	def test_min_has_correct_output_after_five_zig_zag_higher
		tree.insert(61, "The Shape of Voice")
		tree.insert(92, "Sharknado 5")
		tree.insert(73, "I'll Be Here")
		tree.insert(87, "Birdman")
		tree.insert(84, "Giantbomb")
		min_rating = tree.min
		assert_equal min_rating, {"The Shape of Voice" => 61}
	end

	def test_min_has_correct_output_after_five_lower
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(10, "Your Name")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(4, "Sunset Blood")
		min_rating = tree.min
		assert_equal min_rating, {"Sunset Blood" => 4}
	end

	def test_min_has_correct_output_after_five_zig_zag_lower
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(10, "Your Name")
		min_rating = tree.min
		assert_equal min_rating, {"Sunset Blood" => 4}
	end

	def test_depth_of_has_correct_output_after_zero_inserts
		depth_1 = tree.depth_of(61)
		depth_2 = tree.depth_of(16)
		depth_3 = tree.depth_of(92)
		assert_nil depth_1
		assert_nil depth_2
		assert_nil depth_3
	end

	def test_depth_of_has_correct_output_after_one_insert
		tree.insert(61, "The Shape of Voice")
		depth_1 = tree.depth_of(61)
		depth_2 = tree.depth_of(16)
		depth_3 = tree.depth_of(92)
		assert_equal depth_1, 0
		assert_nil depth_2
		assert_nil depth_3
	end

	def test_depth_of_has_correct_output_after_two_inserts
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		depth_1 = tree.depth_of(61)
		depth_2 = tree.depth_of(16)
		depth_3 = tree.depth_of(92)
		assert_equal depth_1, 0
		assert_equal depth_2, 1
		assert_nil depth_3
	end
	def test_depth_of_has_correct_output_after_three_inserts
		tree.insert(61, "The Shape of Voice")
		tree.insert(16, "Johnny English")
		tree.insert(92, "Sharknado 5")
		depth_1 = tree.depth_of(61)
		depth_2 = tree.depth_of(16)
		depth_3 = tree.depth_of(92)
		assert_equal depth_1, 0
		assert_equal depth_2, 1
		assert_equal depth_3, 1
	end

	def test_depth_of_has_correct_output_after_many_inserts
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(10, "Your Name")
		tree.insert(92, "Sharknado 5")
		tree.insert(73, "I'll Be Here")
		tree.insert(87, "Birdman")
		tree.insert(84, "Giantbomb")
		depth_1 = tree.depth_of(61)
		depth_2 = tree.depth_of(4)
		depth_3 = tree.depth_of(92)
		depth_4 = tree.depth_of(16)
		depth_5 = tree.depth_of(73)
		depth_6 = tree.depth_of(7)
		depth_7 = tree.depth_of(87)
		depth_8 = tree.depth_of(10)
		depth_9 = tree.depth_of(84)
		assert_equal depth_1, 0
		assert_equal depth_2, 1
		assert_equal depth_3, 1
		assert_equal depth_4, 2
		assert_equal depth_5, 2
		assert_equal depth_6, 3
		assert_equal depth_7, 3
		assert_equal depth_8, 4
		assert_equal depth_9, 4
	end

	def test_sort_has_correct_output_after_zero_inserts
		sort_1 = tree.sort
		assert_equal sort_1, []
	end

	def test_sort_has_correct_output_after_one_insert
		tree.insert(61, "The Shape of Voice")
		sort_1 = tree.sort
		assert_equal sort_1, [{"The Shape of Voice" => 61}]
	end

	def test_sort_has_correct_output_after_three_inserts
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(84, "Giantbomb")
		sort_1 = tree.sort
		assert_equal sort_1, [{"Your Name" => 10}, {"The Shape of Voice" => 61}, {"Giantbomb" => 84}]
	end

	def test_sort_has_correct_output_after_many_inserts
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(10, "Your Name")
		tree.insert(92, "Sharknado 5")
		tree.insert(73, "I'll Be Here")
		tree.insert(87, "Birdman")
		tree.insert(84, "Giantbomb")
		sort_1 = tree.sort
		assert_equal sort_1, [{"Sunset Blood" => 4}, {"When Harry Met Sally" => 7}, {"Your Name" => 10},
			{"Johnny English" => 16}, {"The Shape of Voice" => 61}, {"I'll Be Here" => 73},
			{"Giantbomb" => 84}, {"Birdman" => 87}, {"Sharknado 5" => 92} ]
	end

	def test_load_has_correct_output_after_nonexistent_file
		load_1 = tree.load("spec/not_a_file.txt")
		assert_nil load_1
	end

	def test_load_has_correct_output_after_empty_file
		upload_count = tree.load("spec/movies_empty.txt")
		assert_equal 0, upload_count
	end

	def test_load_has_correct_output_after_short_file
		upload_count = tree.load("spec/movies_short.txt")
		assert_equal 4, upload_count
	end

	def test_load_has_correct_output_after_medium_file
		upload_count = tree.load("spec/movies_medium.txt")
		assert_equal 9, upload_count
	end

	def test_load_has_correct_output_after_long_file
		upload_count = tree.load("spec/movies_long.txt")
		assert_equal 99, upload_count
	end

	def test_load_has_correct_output_comparing_unique_and_not_unique
		tree_1 = BinarySearchTree.new
		tree_2 = BinarySearchTree.new
		upload_count_1 = tree_1.load("spec/movies_medium.txt")
		upload_count_2 = tree_2.load("spec/movies_medium_not_unique.txt")
		assert_equal upload_count_1 == upload_count_2, true
	end

	def test_load_has_correct_output_after_upload_same_file_twice
		tree_1 = BinarySearchTree.new
		tree_1.load("spec/movies_medium.txt")
		upload_count = tree_1.load("spec/movies_medium.txt")
		assert_equal 0, upload_count
	end

	def test_health_has_correct_output_with_no_inserts
		assert_nil tree.health(0)
	end

	def test_health_has_correct_output_with_few_inserts
		tree.insert(61, "Bill & Ted's Excellent Adventure")
		tree.insert(4, "Sunset Blood")
		tree.insert(92, "Sharknado 5")
		health_1 = tree.health(0)
		health_2 = tree.health(1)
		assert_equal [[61, 3, 100]], health_1
		assert_equal [[4, 1, 33], [92, 1, 33]], health_2
	end

	def test_health_has_correct_output_with_many_inserts
		tree.insert(98, "Animals United")
		tree.insert(58, "Armageddon")
		tree.insert(36, "Bill & Ted's Bogus Journey")
		tree.insert(93, "Bill & Ted's Excellent Adventure")
		tree.insert(86, "Charlie's Angels")
		tree.insert(38, "Charlie's Country")
		tree.insert(69, "Collateral Damage")
		health_1 = tree.health(0)
		health_2 = tree.health(1)
		health_3 = tree.health(2)
		assert_equal [[98, 7, 100]], health_1
		assert_equal [[58, 6, 85]], health_2
		assert_equal [[36, 2, 28], [93, 3, 42]], health_3
	end

	def test_health_has_correct_output_with_upload
		tree.load("spec/movies_medium.txt")
		health_1 = tree.health(0)
		health_2 = tree.health(1)
		health_3 = tree.health(2)
		health_4 = tree.health(3)
		health_5 = tree.health(4)
		assert_equal [[61, 9, 100]], health_1
		assert_equal [[4, 4, 44], [92, 4, 44]], health_2
		assert_equal [[16, 3, 33], [73, 3, 33]], health_3
		assert_equal [[10, 2, 22], [87, 2, 22]], health_4
		assert_equal [[7, 1, 11], [84, 1, 11]], health_5
	end

	def test_health_has_correct_output_with_large_upload
		tree.load("spec/movies_long.txt")
		health_1 = tree.health(0)
		assert_equal health_1, [[71, 99, 100]]
	end

	def test_delete_head_no_descendants
		tree.insert(61, "The Shape of Voice")
		delete_1 = tree.delete(61)
		assert_equal 61, delete_1
	end

	def test_delete_head_one_descendant
		tree.insert(61, "The Shape of Voice")
		tree.insert(73, "I'll Be Here")
		delete_1 = tree.delete(61)
		depth_of_1 = tree.depth_of(73)
		assert_equal 61, delete_1
		assert_equal 0, depth_of_1
	end

	def test_delete_head_two_descendants
		tree.insert(61, "The Shape of Voice")
		tree.insert(73, "I'll Be Here")
		delete_1 = tree.delete(61)
		depth_of_1 = tree.depth_of(73)
		assert_equal 61, delete_1
		assert_equal 0, depth_of_1
	end

	def test_delete_head_many_descendants
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(92, "Sharknado 5")
		tree.insert(73, "I'll Be Here")
		tree.insert(16, "Johnny English")
		delete_1 = tree.delete(61)
		depth_of_1 = tree.depth_of(4)
		depth_of_2 = tree.depth_of(16)
		depth_of_3 = tree.depth_of(73)
		depth_of_4 = tree.depth_of(92)
		assert_equal 61, delete_1
		assert_equal 1, depth_of_1
		assert_equal 2, depth_of_2
		assert_equal 0, depth_of_3
		assert_equal 1, depth_of_4
	end

	def test_delete_node_no_descendants
		tree.insert(61, "The Shape of Voice")
		tree.insert(4, "Sunset Blood")
		tree.insert(92, "Sharknado 5")
		delete_1 = tree.delete(4)
		assert_equal 4, delete_1
	end

	def test_delete_node_one_descendant
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(87, "Birdman")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(73, "I'll Be Here")
		tree.insert(92, "Sharknado 5")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(84, "Giantbomb")
		delete_1 = tree.delete(73)
		depth_of_1 = tree.depth_of(84)
		delete_2 = tree.delete(16)
		depth_of_2 = tree.depth_of(7)
		assert_equal 73, delete_1
		assert_equal 2, depth_of_1
		assert_equal 16, delete_2
		assert_equal 3, depth_of_2
	end

	def test_delete_node_many_descendants
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(87, "Birdman")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(73, "I'll Be Here")
		tree.insert(92, "Sharknado 5")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(84, "Giantbomb")
		delete_1 = tree.delete(87)
		depth_of_1c1 = tree.depth_of(92)
		depth_of_1c2 = tree.depth_of(84)
		depth_of_1c3 = tree.depth_of(73)
		delete_2 = tree.delete(10)
		depth_of_2c1 = tree.depth_of(16)
		depth_of_2c2 = tree.depth_of(7)
		depth_of_2c3 = tree.depth_of(4)
		assert_equal 87,	delete_1
		assert_equal 3, 	depth_of_1c1
		assert_equal 2, 	depth_of_1c2
		assert_equal 1, 	depth_of_1c3
		assert_equal 10,	delete_2
		assert_equal 3,		depth_of_2c1
		assert_equal 2,		depth_of_2c2
		assert_equal 1,		depth_of_2c3
	end

	def test_leaves_head_only
		tree.insert(61, "The Shape of Voice")
		leaves_1 = tree.leaves
		assert_equal 1, leaves_1
	end

	def test_leaves_few_leaves
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(87, "Birdman")
		leaves_1 = tree.leaves
		assert_equal 2, leaves_1
	end

	def test_leaves_many_leaves
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(87, "Birdman")
		tree.insert(4, "Sunset Blood")
		tree.insert(16, "Johnny English")
		tree.insert(73, "I'll Be Here")
		tree.insert(92, "Sharknado 5")
		leaves_1 = tree.leaves
		assert_equal 4, leaves_1
	end

	def test_height_zero_levels
		tree.insert(61, "The Shape of Voice")
		height_1 = tree.height
		assert_equal 0, height_1
	end

	def test_height_one_level
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		height_1 = tree.height
		assert_equal 1, height_1
	end

	def test_height_two_levels
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(4, "Sunset Blood")
		height_1 = tree.height
		assert_equal 2, height_1
	end

	def test_height_three_levels
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(4, "Sunset Blood")
		tree.insert(7, "When Harry Met Sally")
		height_1 = tree.height
		assert_equal 3, height_1
	end

	def test_height_four_levels
		tree.insert(61, "The Shape of Voice")
		tree.insert(10, "Your Name")
		tree.insert(4, "Sunset Blood")
		tree.insert(7, "When Harry Met Sally")
		tree.insert(6, "Sleepless in Seattle")
		height_1 = tree.height
		assert_equal 4, height_1
	end

end
