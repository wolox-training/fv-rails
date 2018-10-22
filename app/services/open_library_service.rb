class OpenLibraryService
  include HTTParty

  base_uri Rails.application.credentials.open_library_uri
  FORMAT = 'json'.freeze
  JSCMD = 'data'.freeze

  attr_accessor :isbn, :base_uri, :format, :jscmd

  def initialize(isbn)
    @isbn = isbn
    @options = {
      query: {
        bibkeys: @isbn,
        format: FORMAT,
        jscmd: JSCMD
      }
    }
  end

  def book_info
    response = retrieve_from_api
    return {} if response.nil?

    format_response response
  end

  private

  def retrieve_from_api
    OpenLibraryService.get(OpenLibraryService.base_uri, @options)
                      .parsed_response[@isbn]
  end

  def format_response(res)
    json = {}
    json[:ISBN] = isbn
    json[:title] = res['title']
    json[:subtitle] = res['subtitle']
    json[:number_of_pages] = res['number_of_pages']
    json[:authors] = res['authors']
    json
  end
end
