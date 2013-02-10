Server::Application.routes.draw do
  match 'activities/provoke' => 'activities#provoke'
  match 'activities/dont_provoke' => 'activities#dont_provoke'
end
