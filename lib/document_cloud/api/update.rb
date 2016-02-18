module DocumentCloud
  module API
    module Update
      include DocumentCloud::API::Utils
      DOCUMENT_PATH = "/documents"
      
      # Update a document
      #
      # @see http://www.documentcloud.org/help/api
      # @param id [String] The document id
      # @param options [Hash] Customizable set of options
      # @param options [String]  :title           The document's cannonical title
      # @param options [String]  :source          The source who produced the document
      # @param options [String]  :description     A paragraph of detailed description
      # @param options [String]  :related_article The URL of the article associated with the document
      # @param options [String]  :published_url   The URL of the page on which the document will be embedded
      # @param options [String]  :access          One of 'public', 'private', 'organization', defaults to 'private'
      # @param options [Hash]    :data            A hash of arbitrary key/value data pairs
      # @returns [DocumentCloud::Document] The document uploaded
      def update(id, options={})
        build_object DocumentCloud::Document, put(document_path(id), options)
      end
      
      private
            
        def document_path(document_id)
          "#{DOCUMENT_PATH}/#{document_id.to_i}.json"
        end
      
    end
  end
end
