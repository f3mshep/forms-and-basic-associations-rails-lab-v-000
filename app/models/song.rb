class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name unless self.artist.nil?
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name unless self.genre.nil?
  end

  def note_contents
    self.notes.collect {|note|note.content} unless self.notes.nil?
  end

  def note_contents=(notes)
   notes = notes.delete_if{|note|note.empty?}
   notes.each {|note|self.notes << Note.find_or_create_by(content: note)}
  end

end

