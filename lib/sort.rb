class Sort

	def self.insertion_sort(unsorted)
		sorted = []
		(unsorted.length).times do
			sorted, unsorted = Sort.insert_sorted(sorted, unsorted)
		end
		return sorted
	end

	def self.insert_sorted(sorted, unsorted)
		unsorted_node = unsorted.shift
		i = Sort.determine_position(sorted, unsorted_node)
		sorted.insert(i, unsorted_node)
		return sorted, unsorted
	end

	def self.determine_position(sorted, unsorted_node)
		if sorted.length == 0
			return 0
		else
			sorted.each_with_index do |sorted_node, i|
				if unsorted_node.movie_rating <= sorted_node.movie_rating
					return i
				end
			end
			return -1
		end
	end

end
