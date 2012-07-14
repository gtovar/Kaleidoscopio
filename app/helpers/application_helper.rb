module ApplicationHelper


def javascript(*args)
  content_for(:head) { javascript_include_tag(*args) }
end



  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Kaleydoscopio"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def logo(where)
    home = "kaleydoscopio_logo_home.png"
    if where.empty?
      "kaleydoscopio_logo.png"
    else
      home
    end
  end

end
