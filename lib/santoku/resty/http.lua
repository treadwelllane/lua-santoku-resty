local http = require("resty.http")
local err = require("santoku.error")

local function request (opts)
  -- TODO: cache?
  http = http.new()
  local res, e = http:request_uri(opts.url, {
    method = opts.method,
    body = opts.body,
    headers = opts.headers,
    ssl_verify = opts.ssl_verify,
  })
  if not res then
    return err.error(e)
  end
  return {
    status = res.status,
    headers = res.headers,
    body = res.body
  }
end

return {
  request = request
}
