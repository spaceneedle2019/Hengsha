module Views
  module Base
    MD_DIR = 'views/templates/md/**/*'.freeze

    def self.render_markdown
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML)
      Dir.glob(MD_DIR).map {|file_name| markdown.render(File.read(file_name)) if File.file?(file_name)}.join
    end
  end
end
