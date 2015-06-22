# Database Optimizations

## Objectives

After completing this assignment, you should...

* Understand the downsides of loops within loops in Rails.
* Understand the benefits and appropriate use of indices on database tables.
* Understand the downside of indices.
* Be able to measure the runtime of various webapp functions.
* Be able to query the database more efficiently.
* Be able to implement database indices.

## Deliverables

* **Estimate:**  ~3.5 hrs
* **A README.** The README should include data on all of the metrics requested below.
* **A test suite.** Build your application using TDD.  Your test suite must include unit tests, controller tests, and at least two integration tests.
* **A reflection on your estimate.**

## Normal Mode

* Run `rake db:seed`, but time it.  Record the amount of time it takes for the seeds to run. **Completed running in 3254.137948 seconds.** (54+ minutes)
* Turn on your server and open your browser.
* Open Chrome's timeline in developer tools, then go to `localhost:3000`.
* Determine how long it takes the index page to load.  Record that time. **Completed 200 OK in 124245ms** (2:04)
* Add appropriate indices to the data structure (via migrations).
* Record how long it takes to run the migrations that add indices. **AddIndices: migrated (1.4633s)**
* Use Chrome's developer tools to determine how long it takes the index page to load.  Record that time. **Completed 200 OK in 2441ms** (0:02)
* Calculate your percent improvement in runtime. **2441ms is 1.96% of 124245ms, so basically a 98% improvement**
* Examine the code that is run when the root path loads.  Modify the commands which access the database to make them more efficient.
* Calculate your percent improvement in runtime.
* Once you have optimized your code as much as you think you can, drop the database, run `rake db:migrate`, and then time how long it takes to run `rake db:seed`.  Was there an improvement or a worsening of runtime?  By what percent and why?
* Which is faster: (a) running `rake db:seed` without indices and then running a migration to add indices, or (b) adding indices during your initial `rake db:migrate`, then running `rake db:seed`?

You've done a good job of analyzing runtime, but now take a look at storage space:

* Record the size of your database (in bytes).
* Record the size of your development log.
* Give at least one method (feel free to Google) for reducing the size of one of these, yet keeping your data intact.
* Do you think that this is smaller, about right, or larger than the size of databases you'll be working with in your career?

## Hard Mode

This data structure has a number of tables connected with a series of one-to-many relationships between them.  A more advanced way to improve efficiency would be to cache the id of the upper-most (ancestor) table's id in a field in the lower-most (descendant) table.  To accomplish this, do the following:

* Write a migration to add this cached foreign key.
* Write callbacks to maintain this foreign key appropriately.  Hint: you will need more than one.
* Modify the report to use this new cached field instead of the actual id stored in the ancestor table.
* Measure the improvement in runtime.
