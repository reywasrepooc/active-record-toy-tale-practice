# Phase 3 Code Challenge: Toy Tale

For this assignment, we'll be working with a Toy domain.

We have three models: `Toy`, `Purchase`, and `Kid`.

For our purposes, a `Toy` has many `Purchases`, a `Kid` has many `Purchases`, and a
`Purchase` belongs to a `Toy` and to an `Kid`.

`Toy` - `Kid` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.

## Topics

- Active Record Migrations
- Active Record Associations
- Class and Instance Methods
- Active Record Querying

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn`. You'll need to create your own sample instances so
that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Kid` and `Toy`
models, and seed data for some `Kids` and `Toys`. The schema currently looks
like this:

### Kids Table

| Column | Type   |
| ------ | ------ |
| name   | String |

### Toys Table

| Column              | Type    |
| ------------------- | ------- |
| name                | String  |
| price               | Integer |

You will need to create the migration for the `purchases` table using the attributes
specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `purchases` table.

- A `Purchase` belongs to a `Toy`, and a `Purchase` also belongs to an `Kid`. In
  your migration, create any columns your `purchases` table will need to establish
  these relationships.
- The `purchases` table should also have:
  - A `quantity` column that stores an integer.

After creating the `purchases` table using a migration, use the `seeds.rb` file to
create instances of your `Purchase` class so you can test your code.

**Once you've set up your `purchases` table**, work on building out the following
deliverables.

### Object Relationship Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

#### Purchase

- `Purchase#kid`
  - should return the `Kid` instance for this purchase
- `Purchase#toy`
  - should return the `Toy` instance for this purchase

#### Toy

- `Toy#purchases`
  - returns a collection of all the purchases for the toy
- `Toy#kids`
  - returns a collection of all the kids who performed in the toy

#### Kid

- `Kid#purchases`
  - should return a collection of all the purchases that the kid has played
- `Kid#toys`
  - should return a collection of all the toys that the kid has performed in

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Kid.first.toys` and see a list of the
toys for the first kid in the database based on your seed data; and
`Purchase.first.kid` should return the kid for the first purchase in the database.

### Aggregate and Association Methods

#### Purchase

- `Purchase#info`
  - should return a string formatted as follows:
    `{insert kid name} bought {insert purchase quantity} {insert toy name} toys.`

#### Kid

- `Kid#make_purchase(toy, quantity)`
  - takes a `toy` (an instance of the `Toy` class) and a `quantity`
    (string) and creates a new `purchase` in
    the database associated with this kid and the toy
- `Kid#all_purchase_info`
  - should return an Array of strings with all the purchases for this kid
    formatted as follows:
    ["{insert kid name} bought {insert purchase quantity} {insert toy name} toys.", ...]
- `Kid#throw_out(toy)`
  - takes an `toy` (an instance of the `Toy` class) and reduces the quantity purchased of that toy by 1
  - you will have to update the quantity column from a row from the `purchases` table to get this to work!
- `Kid#throw_all_out(toy)`
  - takes an `toy` (an instance of the `Toy` class) and removes their purchase from this kid
  - you will have to delete a row from the `purchases` table to get this to work!

#### Toy

- `Toy.most_expensive`
  - returns one instance of a Toy with the highest price
- `Toy.most_popular`
  - returns one instance of a Toy that has the most purchases (quantity doesn't matter)
- `Toy#kids_names`
  - returns of an array of the names of the kids who have purchased the toy