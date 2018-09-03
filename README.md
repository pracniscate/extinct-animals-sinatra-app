# Extinct Animals

Extinct Animals is a simple Sinatra CRUD app which utilises the MVC architectural pattern and an SQLite3 database. Users can create an account, log in, and create entries about extinct animals. Users are not allowed to edit or delete animal entries that do not belong to them.

## Getting Started

Open your terminal and clone this repository:

```
git clone https://github.com/pracniscate/extinct-animals-sinatra-app.git
```
Change directory:

```
cd extinct-animals-sinatra-app
```

### Installing

Install all of the gems with bundle:

```
bundle install
```

Migrate the database:

```
rake db:migrate
```

## Deployment

Run the server:

```
rackup config.ru
```

Then, navigate to your `localhost` address, and paste it into your browser's address bar:

```
http://localhost:9292
```

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The back-end language used
* CSS & HTML - Used to develop the front-end
* [ActiveRecord](https://guides.rubyonrails.org/active_record_basics.html) - Represents the model of the program
* [SQLite3](https://sqlite.org/index.html) - Relational database management system
* [Sinatra](http://sinatrarb.com/) - Ruby DSL used to create websites

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pracniscate/extinct-animals-sinatra-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

* Learn.co Sinatra study groups
* [Corneal gem](https://github.com/thebrianemory/corneal) was used to generate the basic structure of the app