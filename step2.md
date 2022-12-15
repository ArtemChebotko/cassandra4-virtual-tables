<!-- TOP -->
<div class="top">
  <img src="https://datastax-academy.github.io/katapod-shared-assets/images/ds-academy-logo.svg" />
  <div class="scenario-title-section">
    <span class="scenario-title">Virtual Tables</span>
    <span class="scenario-subtitle">ℹ️ For technical support, please contact us via <a href="mailto:aleksandr.volochnev@datastax.com">email</a> or <a href="https://dtsx.io/aleks">LinkedIn</a>.</span> 
  </div>
</div>

<!-- NAVIGATION -->
<div id="navigation-top" class="navigation-top">
 <a href='command:katapod.loadPage?[{"step":"step1"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 2 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step3"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Inspect virtual tables</div>

Let's have a look at the virtual tables that are available, and the specific
keyspaces where these tables are located. We will execute CQL statements in `cqlsh-terminal`.

✅ First, list the existing keyspaces in the CQL shell:
```
### cqlsh
DESCRIBE KEYSPACES;
```

Notice there are two keyspaces named `system_virtual_schema` and `system_views`.
They are special-purpose keyspaces designed to host virtual tables only.

✅ We will work with the `system_views` keyspace, so let us make it the default
one for subsequent CQL statements:
```
### cqlsh
USE system_views;
```

✅ Get a listing of all tables in this keyspace:
```
### cqlsh
DESCRIBE TABLES;
```

A virtual table that provides valuable insight into read performance
is the `tombstones_per_read` table: it contains a row for each table
in the database, with statistics on how many tombstones are encountered
while reading.

✅ Let's have a closer look at the table structure:
```
### cqlsh
DESCRIBE TABLE tombstones_per_read;
```

Remember that the output of this command is for reference only, since
(as we will soon see) you cannot directly alter these tables.

Look at the primary key for table `tombstones_per_read`: there is indeed
one row for each table in the database.
One can imagine building a performance-monitoring tool based on the contents of these rows.

Another very important table is the `settings` table.
It provides a way to
programmatically access the whole configuration as specified in file
`cassandra.yaml`.

✅ Try reading the table in its entirety:
```
### cqlsh
SELECT * FROM settings;
```

How many rows does the table contain? _(Hint: press_ Enter _until you get
to the total row count.)_

✅ Try looking for a particular setting:
```
### cqlsh
SELECT value FROM settings where name = 'num_tokens';
```

Can you find out what _data type_ the `value` column is? How?
_(Hint: the answer can be found in the output of one of the commands above.)_
Do you have an explanation for this choice of data type?

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step1"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step3"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>
