include Rack::Test::Methods

alias request last_request

alias response last_response

describe 'Project tree' do
  def app
    Git::Lighttp::Treeish.configure do |server|
      server.project_root = fixtures
    end
    Git::Lighttp::Treeish
  end

  it 'get tree of project from reference' do
    get '/mycode.git/HEAD' do
      assert_equal 200, response.status, request.env['sinatra.error']
      assert_match 'application/json', response.content_type
      assert_match 'README.txt', response.body
      assert_equal 3, JSON.parse(response.body).size
    end
  end

  it 'get tree of project from reference and path' do
    get '/mycode.git/HEAD/lib' do
      assert_equal 200, response.status, request.env['sinatra.error']
      assert_match 'application/json', response.content_type
      assert_match 'mycode.rb', response.body
      assert_equal 'mycode.rb', JSON.parse(response.body).first['fname']
      assert_equal 1, JSON.parse(response.body).size
    end
  end
end
