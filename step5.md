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
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 5 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Check read timeout</div>

Virtual tables are also a great way to access all sorts of settings and
configuration parameters for a Cassandra node.

Let's turn our attention to the _read request timeout_, a quantity that
specifies how long this node will wait before timing out when it's acting
as read query coordinator.

✅ You can look for the setting directly in the `cassandra.yaml` file:
```
### bash
grep "read_request_timeout_in_ms:" $HOME/apache-cassandra/conf/cassandra.yaml
```

✅ Alternatively, you can use the corresponding `get*`
operation offered by `nodetool`:
```
### bash
nodetool gettimeout read
```

✅ With virtual tables, the same information is now available with a `SELECT`:
```
### cqlsh
SELECT * FROM system_views.settings
    WHERE name = 'read_request_timeout_in_ms';
```

In most situations, the default setting (5000 milliseconds)
is perfectly fine; however, there may be exceptions, as we will soon see.

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

