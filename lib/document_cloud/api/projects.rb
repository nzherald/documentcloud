module DocumentCloud
  module API
    module Projects
      include DocumentCloud::API::Utils
      PROJECTS_PATH = "/projects.json"

      # List projects
      #
      # @returns [DocumentCloud::Project] An array of fetched project entities
      def projects
        build_objects DocumentCloud::Project, get(PROJECTS_PATH)
      end
    end
  end
end
