class OpenLibraryService
  include HTTParty

  base_uri Rails.application.credentials.open_library_uri
  format :json
  
  attr_accessor :isbn, :base_uri, :format, :jscmd

  def initialize(isbn)
    @base_uri = OpenLibraryService.base_uri
    @format = 'json'
    @jscmd = 'data'
    @isbn = isbn
  end

  def book_info
    response = request_isbn
    if response.nil? || !isbn.start_with?('ISBN:')
      nil
    else
      cleanup(response.parsed_response[isbn])
    end
  end

  private
  def request_isbn
    OpenLibraryService.get(base_uri, query: { bibkeys: isbn,
                                              format: format,
                                              jscmd: jscmd })
  end

  def cleanup(res)
    json = {}
    json[:ISBN] = isbn
    json[:title] = res['title']
    json[:subtitle] = res['subtitle']
    json[:number_of_pages] = res['number_of_pages']
    json[:authors] = res['authors']
    json
  end
end
