module DocumentCloud
  module API
    module Document
      include DocumentCloud::API::Utils
      DOCUMENT_PATH = "/documents"
      
      # Fetch a document
      #
      # @param id [String] The document id
      # @returns [DocumentCloud::Document] The fetched document
      def document(id)
        build_object DocumentCloud::Document, get(document_path(id))
      end
      
      private
            
        def document_path(document_id)
          "#{DOCUMENT_PATH}/#{document_id.to_i}.json"
        end
      
    end
  end
end
