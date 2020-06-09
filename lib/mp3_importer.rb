require "pry"

class MP3Importer
attr_accessor :path
@filenames = []
  
  def initialize(path)
    @path = path
  end
  
  def files
    filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
        puts "names=#{filenames}"
        filenames
  end
    
  def import
    files.each { |filename| Song.new_by_filename(filename) }
  end
  
end