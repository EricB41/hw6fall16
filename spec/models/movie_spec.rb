require 'spec_helper'
require 'rails_helper'


describe Movie do
  #fixtures :tmdb_movies
  describe 'searching Tmdb by keyword' do
    context 'with valid key' do
      it 'should call Tmdb with title keywords' do
        expect( Tmdb::Movie).to receive(:find).with('Inception')
        Movie.find_in_tmdb('Inception')
      end
      it 'should return the Tmdb results to the controller' do
        fake_results = [double('Movie1'), double('Movie2')]
        allow(Tmdb::Movie).to receive(:find).with('SELT').and_return (fake_results)
        expect {Movie.find_in_tmdb('Inception') }.to eq(fake_results)
      end
    end
    context 'with invalid key' do
      it 'should raise InvalidKeyError if key is missing or invalid' do
        allow(Tmdb::Movie).to receive(:find).and_raise(Tmdb::InvalidApiKeyError)
        expect {Movie.find_in_tmdb('Inception') }.to raise_error(Movie::InvalidKeyError)
      end
    end
  end
end
