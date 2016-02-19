module DocumentCloud
  module API
    module Page
      include DocumentCloud::API::Utils

      # Fetch document entities
      #
      # @param id [String] The document id
      # @returns [Hash] The fetched document entities
      def page(id, page_number, url)
        url = URI.escape(replace_page_number(url, page_number))
        text = get(url, {}, false)
        DocumentCloud::Page.new(id: id,
                                page_number: page_number,
                                text: text)
      end

      private

      def replace_page_number(url, page_number)
        url.sub(/\{page\}/, page_number.to_s)
      end

    end
  end
end
