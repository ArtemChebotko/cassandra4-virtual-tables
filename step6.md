<!-- TOP -->
<div class="top">
  <img src="https://datastax-academy.github.io/katapod-shared-assets/images/ds-academy-logo.svg" />
  <div class="scenario-title-section">
    <span class="scenario-title">Internode Messaging Improvements</span>
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

<div class="step-title">Review the messaging metrics</div>

Let's review the messaging metrics by querying the virtual tables. 
Since the tables are local to each Cassandra node, we need to connect to different nodes in the cluster and query their local tables.

✅ Display messaging metrics on the first node:
```
cqlsh localhost 9042 -e "
      SELECT * FROM system_views.internode_inbound;
      SELECT * FROM system_views.internode_outbound;"
```

✅ Display messaging metrics on the second node:
```
cqlsh localhost 9043 -e "
      SELECT * FROM system_views.internode_inbound;
      SELECT * FROM system_views.internode_outbound;"
```

Notice how each node records communication with its peer node in a different datacenter. When connected to the node in `DC-West`, we can see messages exchanged with the node in `DC-East` and vice versa.

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step5"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step7"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

