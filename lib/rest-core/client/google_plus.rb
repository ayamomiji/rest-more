require 'rest-core'

# Usage:
#
#     # create client id: https://code.google.com/apis/console/
#     gp = RestCore::GooglePlus.new(client_id: CLIENT_ID,
#                                   client_secret: CLIENT_SECRET,
#                                   redirect_uri: REDIRECT_URI)
#     gp.authorize_url # copy and paste the URL in browser to authorize
#     gp.authorize!(CODE)
#     p gp.me
#
# The full API doc is here: https://developers.google.com/+/api/
RestCore::GooglePlus = RestCore::Builder.
  client(:data, :client_id, :client_secret, :redirect_uri) do

  s = self.class # this is only for ruby 1.8!
  use s::Timeout       , 10
  use s::DefaultSite   , 'https://www.googleapis.com/plus/v1/'
  use s::DefaultHeaders, {'Accept'          => 'application/json',
                          'Accept-Language' => 'en-us'}
  use s::Oauth2Query   , nil
  use s::CommonLogger  , nil
  use s::Cache         , nil, 600 do
    use s::JsonDecode  , true
  end
  use s::Defaults      , :data => {}
end

module RestCore::GooglePlus::Client
  def authorize_url
    url('https://accounts.google.com/o/oauth2/auth',
        :response_type => 'code',
        :client_id => client_id,
        :redirect_uri => redirect_uri,
        :scope => 'https://www.googleapis.com/auth/plus.me')
  end

  def authorize!(code)
    self.data = post('https://accounts.google.com/o/oauth2/token',
                     :code => code,
                     :client_id => client_id,
                     :client_secret => client_secret,
                     :redirect_uri => redirect_uri,
                     :grant_type => 'authorization_code')
  end

  def access_token
    data['access_token'] || data['oauth_token'] if data.kind_of?(Hash)
  end

  def access_token= token
    data['access_token'] = token if data.kind_of?(Hash)
  end

  def authorized?
    !!access_token
  end

  def me
    get_people(:me)
  end

  def get_people(user_id)
    get("people/#{user_id}")
  end

  def search_people(query, options = {})
    get("people", options.merge(:query => query))
  end

  def list_people_by_activity(activity_id, collection, options = {})
    get("activities/#{activity_id}/people/#{collection}", options)
  end

  def list_activities(user_id, collection, options = {})
    get("people/#{user_id}/activities/#{collection}", options)
  end

  def get_activity(activity_id, options = {})
    get("activities/#{activity_id}", options)
  end

  def search_activity(query, options = {})
    get("activities", options.merge(:query => query))
  end

  def list_comments(activity_id, options = {})
    get("activities/#{activity_id}/comments", options)
  end

  def get_comment(comment_id)
    get("comments/#{comment_id}")
  end
end

RestCore::GooglePlus.send(:include, RestCore::GooglePlus::Client)
