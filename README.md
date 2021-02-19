# Viewing Party

This was built from the base repo: [viewing party project](https://backend.turing.io/module3/projects/viewing_party) from [Turing School of Software and Design](https://turing.io)

### About this App

Viewing party is an application in which users can explore movie options and create a viewing party event for the user and their friend's. 

This project is deployed on:

- [Heroku here](https://viewingfiesta.herokuapp.com)

<!-- [AWS here](https://www.example.com) -->

## Versions

- Ruby 2.5.3

- Rails 5.2.4.3

[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Build Status](https://travis-ci.org/viewingparty/viewing_party.svg?branch=main)](https://travis-ci.org/viewingparty/viewing_party)


<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#schema">Schema</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Application

This application allows a user to schedule, create, and invite their friends to movie nights!

After registering with our application, we allow users to:
* Login securely to their account
* Request, approve, and deny other users as their friends
* Browse for any movie they want to watch
   * They can chose to search for movies by name, popularity, or genre!
* Create a movie party and invite their friends to it!

When searching for movies, users can use helpful information to guide their choices, such as:
* The Movie's Theatrical Poster
* Top Billed Cast
* Notable Reviews

While users cannot currently watch the movies they select for their parties through this application, it is our hope that providing an easy and informative application brings their movie night experience one step closer to reality!

### Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [RSpec](https://github.com/rspec/rspec-rails)
* [Tailwinds](https://tailwindcss.com)
* [Travis CI](https://travis-ci.com/)
* [JavaScript](https://www.javascript.com)


<!-- SCHEMA -->
## Schema

<object data="./erd.pdf" type="application/pdf" width="700px" height="700px">
    <embed src="./erd.pdf">
    <p> Your browser does not support pdfs. Please find it <a href=https://github.com/viewingparty/viewing_party/blob/main/erd.pdf>here</a></p>
    </embed>
</object>

See the [open issues](https://github.com/viewingparty/viewing_party/issues) for a list of proposed features (and known issues).



<!-- GETTING STARTED -->
## Getting Started

### Installation

1. Get a free API Key at [https://www.themoviedb.org/documentation/api](https://www.themoviedb.org/documentation/api)
2. Fork and Clone the repo
   ```
   git clone https://github.com/viewingparty/viewing_party.git
   ```
3. Install gems
     -- For list of Gems see [here](https://github.com/viewingparty/viewing_party/blob/main/Gemfile)
   ```
   bundle install
   ```
4. Setup the database: 
   ```
   rails db:setup
   ```
5. Enter your API and ENV variables in `config/application.yml`
   ```
   movie_api: 'ENTER YOUR API'
   search_limit: '10'        #  less than or equal to 20
   top_rated_limit: '50'     #  can be any size
   ```


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact
[Alex Osborne](https://github.com/AlexanderOsborne)
[James Fox-Collis](https://github.com/jlfoxcollis)
[Max Ribbans](https://github.com/ribbansmax)

Project Link: [https://github.com/viewingparty/viewing_party](https://github.com/ribbansmax/viewing_party)



<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Img Shields](https://shields.io)
* [MIT Open Source License](https://opensource.org/licenses/MIT)
* [GitHub Pages](https://pages.github.com)
* [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)






<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/viewingparty/viewing_party.svg?style=for-the-badge
[contributors-url]: https://github.com/viewingparty/viewing_party/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/viewingparty/viewing_party.svg?style=for-the-badge
[forks-url]: https://github.com/viewingparty/viewing_party/network/members
[stars-shield]: https://img.shields.io/github/stars/viewingparty/viewing_party.svg?style=for-the-badge
[stars-url]: https://github.com/viewingparty/viewing_party/stargazers
[issues-shield]: https://img.shields.io/github/issues/viewingparty/viewing_party.svg?style=for-the-badge
[issues-url]: https://github.com/viewingparty/viewing_party/issues
[product-screenshot]: images/screenshot.png
