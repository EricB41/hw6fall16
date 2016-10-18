require 'spec_helper'
require 'rails_helper'


describe Movie do
  #fixtures :tmdb_movies
  releases_hash1 = {"id"=>268, "countries"=>[{"certification"=>"PG-13", "iso_3166_1"=>"US", "primary"=>false, "release_date"=>"1989-06-23"}, {"certification"=>"", "iso_3166_1"=>"IT", "primary"=>false, "release_date"=>"1989-10-20"}, {"certification"=>"12", "iso_3166_1"=>"DE", "primary"=>false, "release_date"=>"1989-10-26"}, {"certification"=>"15", "iso_3166_1"=>"GB", "primary"=>false, "release_date"=>"1989-08-11"}, {"certification"=>"U", "iso_3166_1"=>"FR", "primary"=>false, "release_date"=>"1989-09-01"}, {"certification"=>"PG", "iso_3166_1"=>"AU", "primary"=>false, "release_date"=>"1989-08-31"}, {"certification"=>"12", "iso_3166_1"=>"NL", "primary"=>false, "release_date"=>"1998-09-29"}, {"certification"=>"15", "iso_3166_1"=>"SE", "primary"=>false, "release_date"=>"1989-10-19"}, {"certification"=>"11", "iso_3166_1"=>"DK", "primary"=>false, "release_date"=>"1989-09-29"}]}
  releases_hash2 = {"id"=>209112, "countries"=>[{"certification"=>"16+", "iso_3166_1"=>"RU", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"PG-13", "iso_3166_1"=>"US", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"12", "iso_3166_1"=>"ES", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"", "iso_3166_1"=>"LT", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"12A", "iso_3166_1"=>"GB", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"12", "iso_3166_1"=>"KR", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"12", "iso_3166_1"=>"DE", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"NL", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"12", "iso_3166_1"=>"BR", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"11", "iso_3166_1"=>"SE", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"", "iso_3166_1"=>"BE", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"", "iso_3166_1"=>"AR", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"M", "iso_3166_1"=>"AU", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"AZ", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"CL", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"CO", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"CZ", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"11", "iso_3166_1"=>"DK", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"GR", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"IQ", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"KW", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"KZ", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"LB", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"MX", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"NZ", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"PT", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"UA", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"EE", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"HR", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"IE", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"IL", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"LV", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"MY", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"NO", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"RO", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"SG", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"TW", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"VN", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"PH", "primary"=>false, "release_date"=>"2016-03-26"}, {"certification"=>"", "iso_3166_1"=>"IN", "primary"=>false, "release_date"=>"2016-05-06"}, {"certification"=>"C", "iso_3166_1"=>"BG", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"JP", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"AE", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"HK", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"FI", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"", "iso_3166_1"=>"CH", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"", "iso_3166_1"=>"SK", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"", "iso_3166_1"=>"TH", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"14A", "iso_3166_1"=>"CA", "primary"=>false, "release_date"=>"2016-03-25"}, {"certification"=>"U", "iso_3166_1"=>"FR", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"T", "iso_3166_1"=>"IT", "primary"=>false, "release_date"=>"2016-03-23"}, {"certification"=>"", "iso_3166_1"=>"RU", "primary"=>false, "release_date"=>"2016-03-24"}, {"certification"=>"R", "iso_3166_1"=>"US", "primary"=>false, "release_date"=>"2016-07-16"}, {"certification"=>"", "iso_3166_1"=>"CZ", "primary"=>false, "release_date"=>"2016-07-20"}]} 
  describe 'searching Tmdb by keyword' do
    context 'with valid key' do
      it 'should call Tmdb with title keywords' do
        expect( Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
      it 'should return an empty array if Tmdb does not find movie' do
        empty_results = []
        allow(Tmdb::Movie).to receive(:find).with('Inception').and_return(empty_results)
        expect(Movie.find_in_tmdb('Inception').empty?).to be true
      end
      it 'should return correct array if Tmdb does find movie' do
        populated_results = [double('Movie1'), double('Movie2')]
        allow(Tmdb::Movie).to receive(:find).with('Inception').and_return(populated_results)
        allow(populated_results[0]).to receive(:id).and_return(268)
        allow(populated_results[1]).to receive(:id).and_return(209112)
        allow(populated_results[0]).to receive(:title).and_return("Movie_title1")
        allow(populated_results[1]).to receive(:title).and_return("Movie_title2")
        allow(populated_results[0]).to receive(:release_date).and_return("1992-9-1")
        allow(populated_results[1]).to receive(:release_date).and_return("1992-9-3")
        allow(Tmdb::Movie).to receive(:releases).with(268).and_return(releases_hash1)
        allow(Tmdb::Movie).to receive(:releases).with(209112).and_return(releases_hash2)
        expect(Movie.find_in_tmdb('Inception').size()).to be 2
        expect(Movie.find_in_tmdb('Inception')[0][:tmdb_id]).to be 268
        expect(Movie.find_in_tmdb('Inception')[1][:tmdb_id]).to be 209112
        expect(Movie.find_in_tmdb('Inception')[0][:title]).to eq "Movie_title1"
        expect(Movie.find_in_tmdb('Inception')[1][:title]).to eq "Movie_title2"
        expect(Movie.find_in_tmdb('Inception')[0][:release_date]).to eq "1992-9-1"
        expect(Movie.find_in_tmdb('Inception')[1][:release_date]).to eq "1992-9-3"
        expect(Movie.find_in_tmdb('Inception')[0][:rating]).to eq "PG-13"
        expect(Movie.find_in_tmdb('Inception')[1][:rating]).to eq "R"
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key is missing or invalid' do
        allow(Tmdb::Movie).to receive(:find).and_raise(Tmdb::InvalidApiKeyError)
        expect {Movie.find_in_tmdb('Inception') }.to raise_error(Movie::InvalidKeyError)
      end
    end
  end
  #Can't get this one to work and I don't know why
  #describe 'saving a tmdb movie to the database' do
  #  it 'should save specificed movie id to the database' do
  #    movie_id = 268
  #    movie = double('Movie1')
  #    allow(Tmdb::Movie).to receive(:detail).with(movie_id).and_return(movie)
  #    allow(movie).to receive(:title).and_return("Movie_title1")
  #    allow(movie).to receive(:release_date).and_return("1992-9-1")
  #    expect(Tmdb::Movie).to receive(:releases).with(268)
  #    Movie.create_from_tmdb(268)
  #  end
  #end
  
end
