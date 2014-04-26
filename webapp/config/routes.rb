CodeGolf::Application.routes.draw do
  root 'leaderboard#show'
  resource :leaderboard
end
