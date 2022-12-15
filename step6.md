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
 <a href='command:katapod.loadPage?[{"step":"step5"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 6 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step7"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Change read timeout</div>

_A heavy exceptional maintenance task is starting on your node:
you need to temporarily
raise the read timeout to 18 seconds until the task is over. This way, you'll
prevent the application from repeatedly timing out
(increased latency is more acceptable in your case)._

✅ You sure don't want to edit `cassandra.yaml` and restart the nodes, so you
decide to change this setting on the fly, with:
```
### bash
nodetool settimeout read 18000
```

(remember writing on a virtual table is not supported... yet.)

✅ Now, does the `cassandra.yaml` automatically reflect this change? Let's find out:
```
### bash
grep "read_request_timeout_in_ms:" /etc/cassandra/cassandra.yaml
```

✅ Does `nodetool` itself reflect the change? Let's check:
```
### bash
nodetool gettimeout read
```

✅ Does the virtual-table method give you the newly-set value of 18000? Let's see:
```
### cqlsh
SELECT * FROM system_views.settings WHERE name = 'read_request_timeout_in_ms';
```

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step5"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step7"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

