module Viddl

  module System

    extend self

    # Validate that the system has all of its dependencies
    # @return [Boolean]
    def validate
      validate_ffmpeg && validate_youtube_dl
    end

    private

    # Validate that ffmpeg is installed
    # @return [Boolean]
    def validate_ffmpeg
      result = Kernel.system("ffmpeg")
      if result.nil?
        raise("Viddl requires that ffmpeg be installed")
      end
      true
    end

    # Validate that yt-dlp is installed
    # @return [Boolean]
    def validate_youtube_dl
      result = Kernel.system("yt-dlp")
      if result.nil?
        raise("Viddl requires that yt-dlp be installed https://github.com/yt-dlp/yt-dlp")
      end
      true
    end

  end

end
