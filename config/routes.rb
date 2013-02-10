Server::Application.routes.draw do
  root :to => 'home#index'
  match 'activities/provoke' => 'activities#provoke'
  match 'activities/dont_provoke' => 'activities#dont_provoke'
end
