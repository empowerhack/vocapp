# VocApp

| Phase | Prototype |
| ----- | -------------- |
| Due date | 2nd Sept 2016  |

### Goal

The purpose of VocApp is to support refugees studying at university in a second language. Refugee students starting courses in Europe in a second language (English, German and French) often struggle in the initial stages with the academic and technical vocabulary used in their courses. They receive lots of offers language training to access university but this is conversational English or Turkish, and not the same as what their lecturer is saying in class. This means that refugee students, amongst other pressures, are not only learning their new subject and trying to become fluent in a new language, but also learning a new academic vocabulary. VocApp will be a web-based platform that provides contextualised translation of terms Arabic<>English/German/French, online support from Syrian peers and Syrian academics, and an intuitive learning software to help speed students' transition into a new course in an unfamiliar language.

### Description

An online web-based academic language learning tool to support refugee students studying in second languages. The goal of the first phase of this project is to build a prototype language learning tool as a proof of concept to test with students in the field. The platform tool will provide contextualised translation of terms and online support from Syrian peers and Syrian academics, and initially the languages involved will be Arabic and English.

More information in [wiki](https://github.com/empowerhack/vocapp/wiki)

## Overview

### Project goals

* Design, build and deploy a prototype to pilot with students for feedback

### Product Owner(s)

* EmpowerHack - [Kim Lawrie](https://github.com/atmostat), [Eddie Jaoude](https://github.com/eddiejaoude)
* Jamiya Project - [Ben Webster](https://github.com/benwebster0)

### PM/Scrum Master

* [Natsuki Pope] (https://github.com/nzi102)

### Team Members

Architect & Development Team:
* UX: Victoria Ogundare
* Developers: [Erika Pheby] (https://github.com/eripheebs), [Paul Rees] (https://github.com/paulalexrees), [Kevin McCarthy] (https://github.com/kevinpmcc), [Rhiannon Lolley Neville] (https://github.com/rhiannonruth)

Research & Content
* Content & User Research - Malaz Safarjalani, Jamiya Project (Slack: malaz_jamiya, Email: malaz@jamiya.org)
* Advisory - Ben Webster, Jamiya Project (Slack: benwebster, Email: ben@jamiya.org)
* Data Gathering - Oula, Jamiya Project (Email: oula@jamiya.org)

### Architecture

* Monolith - for `prototype` phase keep simple as possible
* Ruby
* Twitter Bootstrap
* MySQL

### Terminology

* “Contextualised translation” - (as we'd conceived in the hack) As well as providing the equivalent term in a second language, providing an explanation of use and application in a subject matter context relevant to the user

---

## Details

### 3rd party data

* Potential collaboration with Arabterm - a dictionary for students and professionals

### Hosting

* Prototype is on [heroku] (https://vocabulary-app.herokuapp.com/)


---

#### Installation Instructions
1.Clone the repo. In terminal or other command line tool enter
```
git clone https://github.com/empowerhack/vocapp.git
```
2.move into project folder
```
cd vocapp
```
3.If you know you have bundler installed skip this step. If you're not sure put in
following
```
gem install bundler
```
4.Install all gems
```
bundle install
```
5.Enter each of below commands to set up database and seed with example data
```
bin/rake db:create
bin/rake db:migrate
bin/rake db:reset
```
6.Finally to run the application
```
rails s
```

7.In your browser go to
```
localhost:3000
```
8.For Facebook OAuth to work, add your facebook authentication key to an .env file:
```
FACEBOOK_APP_SECRET = [secret key here!]
```
and change the facebook app id to your own in the secrets.yml file:
```
facebook_app_id = [app id here!]
```

### Run tests:
1- create a database called vocapp_test on your psql, then:
```
$ bin/rake db:reset RAILS_ENV=test
$ rspec
```

#### Steps to see all features
* To see all terms - leave search box empty and click search

* To see a term with multiple fields - search for 'algorithm'

* To see an unanswered term and provide definition - First sign up, then search for 'function'

* To add a term - be logged in and search for word of your choosing and click
add term!
