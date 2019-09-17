class Admin::PreferencesController < ApplicationController
    def index
        @preference = Preference.new
        #binding.pry
        #@artist_count = Artist.count 
        #@songs_count = Song.count
        #@last_song = Song.last
    end

=begin
    
<h1>Preferences</h1>

<p>Number of Songs: <%= @songs_count %></p>
<p>Number of Artists: <%= @aritst_count %></p>
<p>Latest Song: <%= @last_song.created_at %></p>
    
=end
end