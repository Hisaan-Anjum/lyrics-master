module LyricsHelper
    def embed(youtube_link)
            if @lyric.youtube_link.present?

         if @lyric.youtube_link.include?("https://www.youtube.com/watch?v=")
      @youtube_id = @lyric.youtube_link.split("https://www.youtube.com/watch?v=").last
      @youtube_url = "https://www.youtube.com/watch?v=#{@youtube_id}"
                content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{@youtube_id}")

      elsif @lyric.youtube_link.include?("https://youtu.be/")
      @youtube_id = @lyric.youtube_link.split("https://youtu.be/").last
      @youtube_url = "https://youtu.be/#{@youtube_id}"
          content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{@youtube_id}")

      else
      @youtube_id = "none"
      end
  end
    end
end
