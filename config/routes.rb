Rails.application.routes.draw do
  root to: "application#index"
  get 'cities', to: 'application#cities'
  get 'display_greetings', to: 'application#display_greetings'
end
