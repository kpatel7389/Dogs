require 'net/http'
require 'json'

get '/images' do
  erb :"index"
end

post '/images' do
    uri = URI('https://api.cognitive.microsoft.com/bing/v5.0/images/search')
    uri.query = URI.encode_www_form({
      q: 'dogs'
    })
    # p uri

    request = Net::HTTP::Post.new(uri.request_uri)
    # Request headers
    request['Content-Type'] = 'multipart/form-data'
    # Request headers
    request['Ocp-Apim-Subscription-Key'] = '794d76ca50a844afba779ebe4c54dbf8'
    # Request body
    request.body = "{body}"

    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        http.request(request)
    end

    hash_data = JSON.parse(response.body)
    @content = hash_data['value'].sample['thumbnailUrl']
  # return @content
  erb :"images"
end
