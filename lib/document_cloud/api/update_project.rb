module DocumentCloud
  module API
    module UpdateProject
      include DocumentCloud::API::Utils
      PROJECT_PATH = "/projects"

      # update a project
      #
      # @see http://www.documentcloud.org/help/api
      # @param id [String] The project id
      # @param options [Hash] Customizable set of options
      # @param options [String] :title        The document's canonical title
      # @param options [String] :description  A paragraph of detailed description
      # @param options [Array]  :document_ids A list of documents that the project contains, by id
      # @returns [DocumentCloud::Project] The project created
      def update_project(id, options={})
        build_object(DocumentCloud::Project, put(project_path(id), options))
      end
      
      private
            
        def project_path(project_id)
          "#{PROJECT_PATH}/#{project_id.to_i}.json"
        end
      
    end
  end
end
