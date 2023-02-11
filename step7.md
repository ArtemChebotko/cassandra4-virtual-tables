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
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 7 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"finish"}]'
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Restart Cassandra</div>

_Now the maintenance is completed and the node load is back to normal.
You could simply revert the timeout setting to its default with
a `nodetool settimeout read 5000` command._

✅ Let's try instead restarting Cassandra on this node to see
if the timeout gets reset to the default of 5 seconds:
```
### bash
pgrep -u gitpod -f cassandra | xargs kill -9
sleep 5
$HOME/apache-cassandra/bin/cassandra
```

✅ Wait until `nodetool status` reports state `UN` (=Up, Normal) again:
```
### bash
nodetool status
```

✅ Now let's look at the timeout value as read through the `system_views.settings`
virtual table:
```
### cqlsh
cqlsh -e "SELECT * FROM system_views.settings 
WHERE name = 'read_request_timeout_in_ms';"
```

_(Note: the node may appear unavailable for a short while, in which case you can
repeat this `SELECT` command to see the results.)_

✅ Compare with the output that `nodetool` provides:
```
### bash
nodetool gettimeout read
```

Has the setting reverted to the default after restarting?

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"finish"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

