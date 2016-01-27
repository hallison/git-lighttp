describe 'HTTP group handler' do
  before do
    @groups = {
      'writers' => %w[mark matthew luke john],
      'disciples' => %w[john peter],
      'prophets' => %w[malachi jeremiah]
    }

    @htgroup = Git::Webby::Htgroup.new(fixtures('htgroup'))
  end

  it 'find member' do
    @groups.each do |group, members|
      members.each do |username|
        found = @htgroup.members(group).include? username
        assert found
      end
    end
  end

  it 'find member' do
    @groups.each do |group, members|
      members.each do |username|
        found = @htgroup.groups(username).include? group
        assert found
      end
    end
  end
end
