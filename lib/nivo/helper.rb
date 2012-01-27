module Nivo
  module Helper
    def slider(show_slider = true)
      @show_slider = show_slider
    end

    def show_slider
      if @show_slider
        @slides = Nivo::Slide.rotate
        render "nivo/slideshow", :slides => @slides
      end
    end
    
    def show_slider_for_page(page_showing)
      @slides = Nivo::Slide.rotate_for_page(page_showing)
      render "nivo/slideshow", :slides => @slides
    end
  end
end
