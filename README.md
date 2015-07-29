# Database Optimizations

* **Estimate:**  
  * ~3.5 hrs
* **A reflection on your estimate.**
  * Took closer to 5.5 hrs, but I was not anticipating the seeds taking an hour to load...lack of familiarity with polymorphic associations and outer vs inner join also slowed me down.



* Run `rake db:seed`, but time it.  Record the amount of time it takes for the seeds to run.  
  * `Completed running in 3254.137948 seconds.` (54+ minutes)
* Determine how long it takes the index page to load.  Record that time.
  * `Completed 200 OK in 124245ms` (2:04)
* Add appropriate indices to the data structure (via migrations).
  * Added `:assembly_id` on `:sequences`, `:sequence_id` on `:genes`, and `[:subject_id, :subject_type]` on `:hits`
* Record how long it takes to run the migrations that add indices.
  * `AddIndices: migrated (1.4633s)`
* Use Chrome's developer tools to determine how long it takes the index page to load.  Record that time.
  * `Completed 200 OK in 2441ms` (0:02)
* Calculate your percent improvement in runtime.
  * 2441ms is 1.96% of 124245ms, so basically a 98% improvement** (After the first load, it's always in the 800-1200ms range, even if I command-R instead of click the refresh button, or even if I change the request to a different assembly name...)
* Examine the code that is run when the root path loads.  Modify the commands which access the database to make them more efficient.
  * Made a long string of `.where` calls--tried to find a solution with `.includes` or `.joins`, but `.where` seemed to be the easiest fix.
* Calculate your percent improvement in runtime.
  * `Completed 200 OK in 259ms`, roughly 90% improvement again
* Once you have optimized your code as much as you think you can, drop the database, run `rake db:migrate`, and then time how long it takes to run `rake db:seed`.  Was there an improvement or a worsening of runtime?  By what percent and why?
  * `Completed running in 3995.667691 seconds.` (66+ minutes) This is a 22% increase in run-time. This is because the indices, though they make the queries much faster, add time to the process of inserting information into the database. I assume this is because the "tree" is being built and adjusted with every new `create!` while seeds are running
* Which is faster: (a) running `rake db:seed` without indices and then running a migration to add indices, or (b) adding indices during your initial `rake db:migrate`, then running `rake db:seed`?
 * Seeding without indices is faster.  I'd trade those 12 minutes of loading seeds for the 1 second migration any day.
* Record the size of your database (in bytes).
  * 572.6 MB
* Record the size of your development log.
  * 1.73 GB
* Give at least one method (feel free to Google) for reducing the size of one of these, yet keeping your data intact.
  * log rotation
* Do you think that this is smaller, about right, or larger than the size of databases you'll be working with in your career?
  * My first instinct is to say this is way bigger than what I'll work with, but then again, if an app has several thousand users, there could be hundreds of data points associated with each of them, and that number only grows over time. So in reality, this may be par for the course?  I have a feeling that it won't be uncommon to work with a database this large, but it will also be more common for the size to be the result of a more complex data structure than this one (rather than half a million items in one table.)
 
######*Assignment from Week 8 of The Iron Yard's Ruby on Rails course (Durham)*
