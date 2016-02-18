module DocumentCloud
  module API
    module Destroy
      include DocumentCloud::API::Utils
      DOCUMENT_PATH = "/documents"
      
      # Delete a document
      #
      # @param id [String] The document id
      def destroy(id)
        delete(document_path(id))
      end
      
      private
            
        def document_path(document_id)
          "#{DOCUMENT_PATH}/#{document_id.to_i}.json"
        end
      
    end
  end
end
