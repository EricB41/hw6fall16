class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  class Movie::InvalidKeyError < StandardError ; end
  
  def self.find_in_tmdb(string)
    movie_list_hash = []
    Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")
    movies_raw = []
    begin
      movies_raw = Tmdb::Movie.find(string)
      
    rescue Tmdb::InvalidApiKeyError
        raise Movie::InvalidKeyError, 'Invalid API key'
    end
    movies_raw.each do |movie|
      found_rating = false
      rating = "G"
      releases = Tmdb::Movie.releases(movie.id)["countries"]
      releases.each do |release|
        if (release["iso_3166_1"] == "US" && (release["certification"] == "G" || release["certification"] == "PG" || release["certification"] == "PG-13"|| release["certification"] == "R" || release["certification"] == "NC-17")) then
          found_rating = true
          rating = release["certification"]
        end
      end
      
      if(found_rating == true) then
        movie_list_hash.push({:tmdb_id => movie.id, :title => movie.title, :rating => rating, :release_date => movie.release_date})
      end
    end
    
    return movie_list_hash
  end
  
  def self.add_tmdb_movies(tmdb_movie_ids)
    tmdb_movie_ids.each do |tmdb_movie_id|
      
    end
    
  end

end
