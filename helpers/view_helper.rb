module ViewHelper
  class << self
    def render_markdown
      html = []
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML)
      md_directory = 'views/md/**/*'
      Dir.glob(md_directory).select do |file_name|
        html << markdown.render(File.read(file_name)) if File.file?(file_name)
      end
      html.join
    end
  end
end