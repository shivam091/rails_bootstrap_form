# Contributing

Thank you so much for considering a contribution to `rails_bootstrap_form`. We love pull requests!

We want everyone to feel welcome to contribute. We encourage respectful exchanges of ideas. We govern ourselves with the Contributor Covenant [Code of Conduct](/CODE_OF_CONDUCT.md).

There are a number of ways you can contribute to `rails_bootstrap_form`:

- Fix a bug or add a new feature
- Add to the documentation
- Review pull requests

## Code Contributions

Here's a quick guide for code contributions:

### 1. Check if issue or feature is available to work on

Make sure no one else is working on the same issue or feature. Search the issues
and pull requests for anything that looks like the issue or feature you want to
address. If no one else is working on your issue or feature, carry on with the
following steps.

### 2. Create an issue, and wait a few days for someone to respond (Optional)

If you create an issue for your feature request or bug, it gives the maintainers a chance to comment on your ideas before you invest a lot of work on a contribution. It may save you some re-work compared to simply submitting a pull request. It's up to you whether you submit an issue.

### 3. Fork the repo

Fork the project. Optionally, create a branch you want to work on.

### 4. Get it running locally

- Install the required dependencies with `bundle install`
- Run tests via: `bundle exec rake`

### 5. Hack away

- Try to keep your changes small. Consider making several smaller pull requests if your changes are extensive.
- Don't forget to add necessary tests and make sure that all tests run successfully.
- Update the README if necessary.
- Add a line to the CHANGELOG for your bug fix or feature.
- Read the [Coding Guidelines](#coding-guidelines) section and make sure that `bundle exec rubocop --autocorrect` doesn't find any offences.

You may find the [demo application](#the-demo-application) useful for development and debugging.

### 6. Make a pull request

- If you've never made a pull request (PR) before, read [this](https://help.github.com/articles/about-pull-requests/).
- If your PR fixes an issues, be sure to put "Fixes #nnn" in the description of the PR (where `nnn` is the issue number). Github will automatically close the issue when the PR is merged.
- When the PR is submitted, check if Travis CI ran all the tests successfully, and didn't raise any issues.

### 7. Done

Somebody will shortly review your pull request and if everything is good, it will be
merged into the main branch. Eventually the gem will be published with your changes.

### Coding guidelines

This project uses [RuboCop](https://github.com/bbatsov/rubocop) to enforce standard Ruby coding guidelines.

- Test that your contribution passes with `bundle exec rubocop`.
- RuboCop is also run as part of the full test suite with `bundle exec rake`.
- Note the Travis build will fail and your PR cannot be merged if RuboCop finds offences.

Note that most editors have plugins to run RuboCop as you type, or when you save a file. You may find it well worth your time to install and configure the RuboCop plugin for your editor. Read the [RuboCop documentation](https://rubocop.readthedocs.io/en/latest/integration_with_other_tools/).

### Supported Versions of Ruby and Rails

The goal of `rails_bootstrap_form` is to support all versions of Rails (higher than 7.0) for bug fixes and security issues. We do not test against versions supported for severe security issues. We test against the minimum [version of Ruby required](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html#ruby-versions) for those versions of Rails.

The Ruby on Rails support policy is [here](https://guides.rubyonrails.org/maintenance_policy.html).

### The Demo Application

There is a demo app in this repository. It shows some of the features of `rails_bootstrap_form`, and provides a base on which to build ad-hoc testing, if you need it.

Currently, the demo app is only set up to run for Rails 7, due to the variety of ways to include CSS and JavaScript in a modern Rails application.
To run the demo app, set up the database and run the server:

```bash
cd demo
bundle
rails db:create
rails db:migrate
```

You'll see errors in the browser console about duplicate ids. This is expected, since the demo app has many forms with the same fields in them. Something we can fix in the future, perhaps.

To use other supported versions of Rails, you will need to create a `Gemfile` for the Rails version. Then, change the `export BUNDLE_GEMFILE...` line to your gem file. Finally, figure out how to include the assets.

If you need to run the Rails server separately, for example, to debug the server, you _must_ run it like this:

```sh
bundle exec rails s -b 0.0.0.0
```

If you run just `rails` or even `bin/rails`, the `sprockets-rails` gem won't load and you'll either get error messages, or the assets  won't be available to the demo app. At the moment it's a mystery why. PRs to fix this are welcome.

Please try to keep the checked-in `.ruby-version` set to the oldest supported version of Ruby. You're welcome and encouraged to try the demo app with other Ruby versions. Just don't check in the `.ruby-version` to GitHub.

## Documentation Contributions

Contributions to documentation are always welcome. Even fixing one typo improves the quality of `rails_bootstrap_form`. To make a documentation contribution, follow steps 1-3 of Code Contributions, then make the documentation changes, then make the pull request (step 6 of Code Contributions).

If you put `[ci skip]` in the commit message of the most recent commit of the PR, you'll be a good citizen by not causing our CI pipeline to run all the tests when it's not necessary.

## Reviewing Pull Requests

We are an entirely volunteer project. Sometimes it's hard for people to find the time to review pull requests. You can help! If you see a pull request that's waiting to be merged, it could be because no one has reviewed it yet. Your review could help move the pull request forward to be merged.

---

Thanks to all the [great contributors](https://github.com/shivam091/rails_bootstrap_form/graphs/contributors).

## Troubleshooting

### Models and Database Tables

`rails_bootstrap_form` needs few models and tables to support testing. It appears that the necessary tables were created via the `demo/db/schema.rb` file. To support `rich_text_area`, Rails 7 creates some migrations. These migrations had to be run in the existing database (not an empty one) to create a new `schema.rb` that creates the `rails_bootstrap_form` test tables, and the tables needed by Rails 7. The `schema.rb` file was checked in to GitHub.

In the future, any new Rails functionality that creates tables would likely have to be prepared the same way:

```bash
cd demo
rails db:create
rails db:migrate
```

### RuboCop

When you push a branch, RuboCop checks may fail, but locally you can't reproduce the failure. This may be because you're using a different version of RuboCop locally. When you push, the RuboCop tests use the currently available version of RuboCop. If you've been working on the branch for a while, it's likely you have a `Gemfile.lock` that specifies an older version of RuboCop.

The first thing to try is to update your `Gemfile.lock` locally:

```bash
bundle update
```

Or, if you really want to minimize your work:

```bash
bundle update --conservative rubocop
```

This should enable you to reproduce the RuboCop failures locally, and then you can fix them.
