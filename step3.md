<!-- TOP -->
<div class="top">
  <img class="scenario-academy-logo" src="https://datastax-academy.github.io/katapod-shared-assets/images/ds-academy-2023.svg" />
  <div class="scenario-title-section">
    <span class="scenario-title">Virtual Tables</span>
    <span class="scenario-subtitle">ℹ️ For technical support, please contact us via <a href="mailto:aleksandr.volochnev@datastax.com">email</a> or <a href="https://dtsx.io/aleks">LinkedIn</a>.</span> 
  </div>
</div>

<!-- NAVIGATION -->
<div id="navigation-top" class="navigation-top">
 <a href='command:katapod.loadPage?[{"step":"step2"}]' 
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 3 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step4"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Understand limitations</div>

Virtual tables and their related keyspaces impose several restrictions
on the kinds of operations that can be performed.

✅ Find out if you can add a column to a virtual table:
```
### cqlsh
ALTER TABLE settings ADD comment TEXT;
```

_Note: this command and the next ones result in errors._

✅ Find out if you can upsert a new row to a virtual table:
```
### cqlsh
INSERT INTO settings (name , value ) VALUES ( 'MaxNumberOfGlorxes', '137');
```

✅ Find ouf if you can clear the contents of a virtual table:
```
### cqlsh
TRUNCATE settings;
```

✅ Find out if you can create an index:
```
### cqlsh
CREATE INDEX ON settings (value);
```

✅ Virtual tables can be queried with the same syntax as regular tables.
Suppose we want to list all (Boolean) settings that are set to "true":
```
### cqlsh
SELECT name FROM settings WHERE value='true';
```

This query, as it is, will fail with a standard message about _data filtering_
(which is how CQL advises against full-cluster scans).
Thanks to the fact that virtual tables are **not** actually distributed,
however, it is
perfectly fine to add the `ALLOW FILTERING` clause to such a query
(indeed, this is one of the very few cases it is acceptable to).

✅ Try the same query with `ALLOW FILTERING`:
```
### cqlsh
SELECT name FROM settings WHERE value='true' ALLOW FILTERING ;
```

This observation will come handy in the next step.

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step2"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>
