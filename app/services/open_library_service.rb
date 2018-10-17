class OpenLibraryService
  include HTTParty

  base_uri Rails.application.credentials.open_library_uri
  default_params format: 'json', jscmd: 'data'
  format :json

  def initialize; end

  def self.book_info(isbn)
    response = request_isbn(isbn)
    if response.nil? || !isbn.start_with?('ISBN:')
      nil
    else
      cleanup(response.parsed_response[isbn], isbn)
    end
  end

  def self.request_isbn(isbn)
    get(base_uri, query: { bibkeys: isbn })
  end

  def self.cleanup(res, isbn)
    json = {}
    json[:ISBN] = isbn
    json[:title] = res['title']
    json[:subtitle] = res['subtitle']
    json[:number_of_pages] = res['number_of_pages']
    json[:authors] = res['authors']
    json
  end

  private_class_method request_isbn, cleanup
end
