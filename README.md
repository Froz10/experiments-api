# experiments-back

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