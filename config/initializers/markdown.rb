require 'pygments'

module Haml::Filters

  remove_filter("Markdown") #remove the existing Markdown filter

  module Markdown # the contents of this are as before, but without the lazy_require call

    include Haml::Filters::Base

    def render text
      markdown.render text
    end

    private

    class HTMLwithPygments < Redcarpet::Render::HTML
      def block_code(code, language)
        Pygments.highlight(code, lexer: language)
      end
    end

    def markdown
      @markdown = Redcarpet::Markdown.new(HTMLwithPygments, {
        autolink:             true,
        fenced_code_blocks:   true,
        no_intra_emphasis:    true,
        strikethrough:    true,
        tables:           true
      })
    end
  end

end
