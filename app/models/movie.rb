class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  class Movie::InvalidKeyError < StandardError ; end
  
  def self.find_in_tmdb(string)
    movie_list_hash = []
    Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")
    
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
        if release["iso_3166_1"] == "US" then
          found_rating = true
          rating = release["certification"]
        end
      end
      
      if found_rating then
        movie_list_hash.push({:tmdb_id => movie.id, :title => movie.title, :rating => rating, :release_date => movie.release_date})
      end
    end
    return movie_list_hash
  end

end
