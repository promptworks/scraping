require 'scraping/rules/element'

module Scraping
  module Rules
    class Elements < Element
      attr_reader :multiselector

      def initialize(name, selector, options = {}, &extract)
        super(name, '.', options, &extract)
        @multiselector = selector
      end

      def call(scraper, node)
        node.search(multiselector).map do |item|
          super scraper, item
        end
      end
    end
  end
end
