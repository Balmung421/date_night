require './lib/load'
require './lib/node'
require './lib/sort'

class BinarySearchTree

  attr_reader :head

  def insert(movie_rating, movie_title)
    if @head.nil?
      @head = Node.new(movie_rating, movie_title)
      return 0
    else
      return @head.insert(movie_rating, movie_title)
    end
  end

  def include?(movie_rating)
    if @head.nil?
      return false
    else
      node = @head.get_node_by_movie_rating(movie_rating)
      node.nil? ? false : true
    end
  end

  def max
    return maxmin("max")
  end

  def min
    return maxmin("min")
  end

  def depth_of(movie_rating)
    if @head.nil?
      return nil
    else
      node = @head.get_node_by_movie_rating(movie_rating)
      node.nil? ? nil : node.depth
    end
  end

  def sort
    if @head.nil?
      return []
    else
      nodes = @head.get_descendant_nodes
      nodes.push(@head)
      nodes = Sort.insertion_sort(nodes)
      return nodes.map { |node| {node.movie_title => node.movie_rating} }
    end
  end

  def load(file_name)
    text_file = Load.open_file(file_name)
    if text_file.nil?
      return nil
    else
      movies = Load.retrieve_movies_list(text_file)
      upload_count = 0
      movies.each do |movie_rating, movie_title|
        depth = insert(movie_rating, movie_title)
        if not depth.nil?
          upload_count += 1
        end
      end
      return upload_count
    end
  end

  def health(desired_depth)
    if @head.nil?
      return nil
    else
      return get_health_list(desired_depth)
    end
  end

  def delete(movie_rating)
    if @head.nil?
      return nil
    else
      delete_node = @head.get_node_by_movie_rating(movie_rating)
      descendant_nodes = delete_node.get_descendant_nodes
      if @head != delete_node
        parent_node = @head.get_parent_node(delete_node)
        if delete_node.movie_rating < parent_node.movie_rating
          parent_node.lower_link = nil
        elsif parent_node.movie_rating < delete_node.movie_rating
          parent_node.higher_link = nil
        end
      else
        @head = nil
        if not descendant_nodes.empty?
          descendant_nodes = Sort.insertion_sort(descendant_nodes)
          head_index = descendant_nodes.length / 2
          @head = descendant_nodes[head_index]
          @head.depth = 0
          descendant_nodes.delete_at(head_index)
        end
      end
      descendant_nodes.each do |descendant_node|
        descendant_node.higher_link = nil
        descendant_node.lower_link = nil
        @head.insert_existing(descendant_node)
      end
      return movie_rating
    end
  end

  def leaves
    return @head.get_leaves.length
  end

  def height
    nodes = @head.get_leaves
    max_height = 0
    nodes.each do |node|
      if node.depth > max_height
        max_height = node.depth
      end
    end
    return max_height
  end

  private

  def maxmin(maxmin)
    if @head.nil?
      return {}
    else
      return @head.maxmin(maxmin)
    end
  end

  def get_nodes_by_depth(desired_depth)
    if @head.nil?
      return nil
    else
      return @head.get_nodes_by_depth(desired_depth)
    end
  end

  def get_health_list(desired_depth)
    health_list = []

    total_number_of_nodes = (@head.get_descendant_nodes.length + 1) / 1.0
    nodes_at_desired_depth = get_nodes_by_depth(desired_depth)

    nodes_at_desired_depth.each do |node|
      node_health_list = []

      number_of_child_nodes = (node.get_descendant_nodes.length + 1)
      node_percent = ((number_of_child_nodes / total_number_of_nodes) * 100).floor

      node_health_list.push(node.movie_rating)
      node_health_list.push(number_of_child_nodes)
      node_health_list.push(node_percent)

      health_list.push(node_health_list)
    end

    return health_list
  end

end
