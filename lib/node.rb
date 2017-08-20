class Node

  attr_accessor :movie_rating, :movie_title, :lower_link, :higher_link, :depth

  def initialize(movie_rating, movie_title, depth=0)
		@movie_rating = movie_rating
		@movie_title = movie_title
    @depth = depth
    @lower_link = nil
    @higher_link = nil
	end

  def insert(movie_rating, movie_title)
    if movie_rating < @movie_rating
      if @lower_link.nil?
        @lower_link = Node.new(movie_rating, movie_title, @depth+1)
        return @depth+1
      else
        @lower_link.insert(movie_rating, movie_title)
      end
    elsif @movie_rating < movie_rating
      if @higher_link.nil?
        @higher_link = Node.new(movie_rating, movie_title, @depth+1)
        return @depth+1
      else
        @higher_link.insert(movie_rating, movie_title)
      end
    end
  end

  def get_node_by_movie_rating(movie_rating)
    if @movie_rating == movie_rating
      return self
    elsif movie_rating < @movie_rating
      if @lower_link.nil?
        return nil
      else
        @lower_link.get_node_by_movie_rating(movie_rating)
      end
    else @movie_rating < movie_rating
      if @higher_link.nil?
        return nil
      else
        @higher_link.get_node_by_movie_rating(movie_rating)
      end
    end
  end

  def maxmin(maxmin)
    if maxmin == "max"
      if @higher_link.nil?
        return { @movie_title => @movie_rating }
      else
        @higher_link.maxmin(maxmin)
      end
    else
      if @lower_link.nil?
        return { @movie_title => @movie_rating }
      else
        @lower_link.maxmin(maxmin)
      end
    end
  end

  def get_descendant_nodes(node_list=[])
    if not @lower_link.nil?
      node_list.push(@lower_link)
      node_list = @lower_link.get_descendant_nodes(node_list)
    end
    if not @higher_link.nil?
      node_list.push(@higher_link)
      node_list = @higher_link.get_descendant_nodes(node_list)
    end
    return node_list
  end

  def get_nodes_by_depth(desired_depth, node_list=[])
    if @depth == desired_depth
      node_list.push(self)
      return node_list
    else
      if not @lower_link.nil?
        node_list = @lower_link.get_nodes_by_depth(desired_depth, node_list)
      end
      if not @higher_link.nil?
        node_list = @higher_link.get_nodes_by_depth(desired_depth, node_list)
      end
      return node_list
    end
  end

  def get_parent_node(child_node)
    if self == child_node
      return nil
    else
      if child_node.movie_rating < @movie_rating
        if not @lower_link.nil?
          if @lower_link == child_node
            return self
          else
            @lower_link. get_parent_node(child_node)
          end
        end
      elsif @movie_rating < child_node.movie_rating
        if not @higher_link.nil?
          if @higher_link == child_node
            return self
          else
            @higher_link.get_parent_node(child_node)
          end
        end
      end
    end
  end

  def insert_existing(node)
    if node.movie_rating < @movie_rating
      if @lower_link.nil?
        @lower_link = node
        node.depth = @depth+1
        return @depth+1
      else
        @lower_link.insert_existing(node)
      end
    elsif @movie_rating < node.movie_rating
      if @higher_link.nil?
        @higher_link = node
        node.depth = @depth+1
        return @depth+1
      else
        @higher_link.insert_existing(node)
      end
    end
  end

  def get_leaves(node_list=[])
    if @lower_link.nil? && @higher_link.nil?
      node_list.push(self)
      return node_list
    else
      if not @lower_link.nil?
        node_list = @lower_link.get_leaves(node_list)
      end
      if not @higher_link.nil?
        node_list = @higher_link.get_leaves(node_list)
      end
    end
    return node_list
  end

end
