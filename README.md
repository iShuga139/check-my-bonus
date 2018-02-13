# check-my-bonus
A simple Sinatra API to check the amount of a bonus

## Sinatra API objective
Calculate the bonus given the following values:
* Salary.
* Percentage of the salary.
* Percentage of your chief.
* Percentage of your company.

### Table of Contents

- [Installation](#Installation)
- [Testing](#Testing)
- [Authors / Contributors](#authors-contributors)

<a name="Installation"></a>
## Installation

1. Clone the repository:

  ```bash
  $ git clone git@github.com:iShuga139/check-my-bonus.git
  $ cd check-my-bonus
  ```

2. Install dependencies:

  ```bash
  $ gem install bundler
  $ bundle install
  ```

3. Execute the application:

  ```bash
  $ bundle exec ruby server.rb
  ```

4. Use the application:
```
Do a GET HTTP request and send parameters by query params
 - Params (the following params are required)
  * salary
  * percentage_company
  * percentage_chief
  * percentage_salary

E.G.
$ http://[host][:port]/api/v1/bonus?percentage_chief=10&salary=1000&percentage_company=50&percentage_salary=5
```
<a name="Testing"></a>
## Testing

This program uses RSpec as testing framework. Tests should be written on the tests directory.

To test the program run from the root project:

```bash
$ rspec
```
When done, you can get a coverage report using:

```bash
$ open coverage/index.html
```

<a name="authors-contributors"></a>
## Authors / Contributors

- **Maintainer:** iShuga
- **Author:** Jonathan Estrada - <jeaworks@hotmail.com>
- **Contributors:**