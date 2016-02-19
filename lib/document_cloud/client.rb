require_relative 'configurable'
require_relative 'api/utils'
require_relative 'api/search'
require_relative 'api/upload'
require_relative 'api/document'
require_relative 'api/page'
require_relative 'api/update'
require_relative 'api/destroy'
require_relative 'api/entities'
require_relative 'api/projects'
require_relative 'api/create_project'
require_relative 'api/update_project'

module DocumentCloud
  class Client
    include DocumentCloud::API::Utils
    include DocumentCloud::API::Search
    include DocumentCloud::API::Upload
    include DocumentCloud::API::Document
    include DocumentCloud::API::Update
    include DocumentCloud::API::Destroy
    include DocumentCloud::API::Entities
    include DocumentCloud::API::Projects
    include DocumentCloud::API::Page
    include DocumentCloud::API::CreateProject
    include DocumentCloud::API::UpdateProject
    include DocumentCloud::Configurable

    def initialize(options={})
      DocumentCloud::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || DocumentCloud.instance_variable_get(:"@#{key}"))
      end
    end

    # Perform HTTP GET request
    def get(path, params = {}, use_request_base = true)
      url = construct_url(path, use_request_base)
      resource = construct_resource(url)
      resource.get params
    end

    # Perform HTTP POST request
    def post(path, params = {}, use_request_base = true)
      url = construct_url(path, use_request_base)
      resource = construct_resource(url)
      resource.post params
    end

    # Perform HTTP PUT request
    def put(path, params = {}, use_request_base = true)
      url = construct_url(path, use_request_base)
      resource = construct_resource(url)
      resource.put params
    end

    # Perform HTTP DELETE request
    def delete(params = {}, use_request_base = true)
      url = construct_url(path, use_request_base)
      resource = construct_resource(url)
      resource.delete
    end

    private

    def construct_url(path, use_request_base)
      use_request_base ? request_base + path : path
    end

    def construct_resource(url)
      RestClient::Resource.new(url, user: @email, password: @password)
    end

    def request_base
      "#{DocumentCloud::Default.http_mode}://#{DocumentCloud::Default.endpoint}"
    end

  end
end
