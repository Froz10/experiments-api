# experiments-back

HTTP API for A/B testing:

GET /api/experiments: returns the JSON with A/B experiments
GET /api/statistics: returns the JSON statistic for a simple table of experiments 

# usage

Fields "value" and "key" obey the law of distribution according to the formula laid down in business logic
```
{"experiments":
  [ 
    { "value":"#0000FF",
      "key":"button_color"},
    { "value":"10",
      "key":"price"} 
  ]
}
```
The request header should look like:
```
"Device-Token: test_user1"
```
## Project setup
```
bundle install
```
### Migrate database
```
rails db:migrate
```
### Run server
```
rails s
```
### Testing
```
curl -H "Device-Token: test_user1" http://localhost:3000/api/experiments
```

# experiments-front

### Run server
```
yarn serve
```
### Testing
```
http://localhost:8080
```