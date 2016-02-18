module DocumentCloud
  module API
    module Entities
      include DocumentCloud::API::Utils
      DOCUMENT_PATH = "/documents"
      ENTITIES_PATH = "/entities.json"
      
      # Fetch document entities
      #
      # @param id [String] The document id
      # @returns [Hash] The fetched document entities
      def entities(id)
        parse_json(get(entities_path(id)))[:entities]
      end
      
      private
            
        def entities_path(document_id)
          "#{DOCUMENT_PATH}/#{document_id.to_i}/#{ENTITIES_PATH}"
        end
      
    end
  end
end
