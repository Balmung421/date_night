class Load

  def self.open_file(file_name)
    begin
       text_file = File.open(file_name)
    rescue
       return nil
    else
      return text_file
    end
  end

  def self.retrieve_movies_list(text_file)
    movies = []
    text_file.each do |line|
      line.gsub!("\n","")
      line.sub!(", ",";")
      movie_rating, movie_title = line.split(";")
      movies.push([movie_rating.to_i, movie_title])
    end
    return movies
  end

end
