module DocumentCloud
  class Page
    attr_reader :document_id, :page_number, :text

    def initialize(attrs={})
      @document_id      = attrs[:id]
      @page_number      = attrs[:page_number]
      @text             = attrs[:text]
    end
  end
end
