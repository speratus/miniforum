[![Travis Build Status](https://travis-ci.org/speratus/miniforum.svg?branch=master)](https://travis-ci.org/speratus/miniforum)

# Miniforum
Miniforum is a small Forum app built for a blog series on dev.to: [Build a Forum App, from code to Deploy][series].

## Features

* Sign up as a user to post questions/answers
* Like posts or replies to express appreciation for the question
* Ranks users and topics according to the number of people who have liked 

## Stack

* Ruby on Rails
* GraphQL
* Minitest
* TravisCI

See full details of the whole application stack [here][series].

## Installation

1. clone the repo
```bash
git clone https://github.com/speratus/miniforum.git
```

2. install the dependencies
```bash
bundle install
```

3. run the server
```bash
rails s
```

[series]: https://dev.to/speratus/build-a-forum-app-from-code-to-deploy-3lcc/