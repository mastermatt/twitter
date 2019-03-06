workflow "Tweet on push to default branch" {
  on = "push"
  resolves = ["Tweet"]
}
 
action "Tweet" {
  uses = "gr2m/twitter-together@master"
  secrets = ["GITHUB_TOKEN", "TWITTER_API_KEY", "TWITTER_API_SECRET_KEY", "TWITTER_ACCESS_TOKEN",  "TWITTER_ACCESS_TOKEN_SECRET"]
}
 
# "push" event won’t work on forks, hence the 2nd workflow with "pull_request"
workflow "Preview and validate tweets on pull requests" {
  on = "pull_request"
  resolves = ["Preview"]
}
 
action "Preview" {
  uses = "gr2m/twitter-together@master"
  secrets = ["GITHUB_TOKEN"]
}
