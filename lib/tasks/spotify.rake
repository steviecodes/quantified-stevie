namespace :spotify do
  desc "Takes the top 50 most recently played tracks and puts them in a db table"
  task :top_fifty => :environment do
    require 'json'

    def read_file()
      JSON.parse(File.read('/Users/swm/develop/feeds/spotify/recently_played.json'))
    end

    def parse_artists(artist_elements)
      artists = []
      artist_elements.each do |artist|
        artists.push(artist['name'])
      end
      artists.join(' / ')
    end

    def parse_images(image_elements)
      images = {} 
      image_elements.each do |image|
        key = "image_" + image['height'].to_s
        images[key] = image['url']
      end
      images
    end

    feed = read_file()

    tracks = []
    feed['items'].each do |element|
      track = OpenStruct.new(element['track']) 
      hash = {
        album_id: element['track']['album']['id'],
        album_name: track.album['name'],
        artists: parse_artists(element['track']['album']['artists']),
        isrc: track.external_ids['isrc'],
        name: track.name,
        played_at: track.played_at,
        preview_url: track.preview_url,
        spotify_id: track.id,
      }
      images = parse_images(element['track']['album']['images'])
      hash.merge!(images)
      tracks.push(OpenStruct.new(hash))
    end

    puts tracks.count
    puts tracks[0].album_id
    puts tracks[0].isrc
  end
end
