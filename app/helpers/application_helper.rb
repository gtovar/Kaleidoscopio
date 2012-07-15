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


def markdown(text, options = {})
  options.reverse_merge!(
    :hard_wrap => true,
    :filter_html => true,
    :autolink => true,
    :no_intraemphasis => true,
    :fenced_code => true,
    :gh_blockcode => true,
  )
  options.reject! { |k, v| !v }
  syntax_highlighter(Redcarpet.new(text, *options.keys).to_html).html_safe
end



def syntax_highlighter(html)
  doc = Nokogiri::HTML(html)
  doc.search("//pre[@lang]").each do |pre|
    pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
  end
  doc.to_s
end



end
