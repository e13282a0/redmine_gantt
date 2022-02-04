Redmine::Plugin.register :redmine_gantt do
  name 'Redmine gantt plugin'
  author 'rc'
  description 'Gantt plugin'
  version '0.0.2'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  #menu :application_menu, :performance, { controller: 'performance', action: 'index' }, caption: 'Insights'
  permission :gantt, { :gantt => [:index] }, :public => true
  menu :project_menu, :gantt2, { controller: 'gantt', action: 'index' }, caption: 'Gantt2', :param => :project_id
end
