Mime::Type.unregister :json
Mime::Type.register "application/json", :json, %w( text/x-json application/jsonrequest application/vnd.api+json )
ActionDispatch::ParamsParser::DEFAULT_PARSERS[Mime::Type.lookup('application/vnd.api+json')]=lambda do |body|
  JSON.parse(body)
end
