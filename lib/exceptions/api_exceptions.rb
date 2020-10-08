module ApiExceptions
  class InvalidRequest < StandardError
    attr_reader :code, :message

    ERROR_CODES = {
      '400': 'Bad Request',
      '401': 'Unauthorized',
      '402': 'Payment Required ',
      '403': 'Forbidden',
      '404': 'Not Found',
      '405': 'Method Not Allowed',
      '406': 'Not Acceptable',
      '407': 'Proxy Authentication Required',
      '408': 'Request Timeout',
      '409': 'Conflict',
      '410': 'Gone',
      '411': 'Length Required',
      '412': 'Precondition Failed',
      '413': 'Payload Too Large',
      '414': 'URI Too Long',
      '415': 'Unsupported Media Type',
      '416': 'Requested Range Not Satisfiable',
      '417': 'Expectation Failed',
      '418': 'I`m a teapot',
      '421': 'Misdirected Request',
      '422': 'Unprocessable Entity (WebDAV)',
      '423': 'Locked (WebDAV)',
      '424': 'Failed Dependency (WebDAV)',
      '425': 'Too Early',
      '426': 'Upgrade Required',
      '428': 'Precondition Required',
      '429': 'Too Many Requests',
      '431': 'Request Header Fields Too Large',
      '451': 'Unavailable For Legal Reasons',
    }

    def initialize(code, message = nil)
      @code = code
      @message = message || ERROR_CODES[@code.to_s.to_sym]
    end

    def to_json
      {
        status: 'error',
        code: @code,
        message: @message
      }
    end
  end
end