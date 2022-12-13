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
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 5 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Internode metrics and virtual tables</div>

One visible aspect of the Cassandra 4.x internode messaging improvements is that internode messaging metrics are now available as virtual tables. In this step, we'll show you what we mean.

Each node in the Cassandra cluster has virtual tables in which Cassandra keeps internode messaging metrics.
Table `internode_inbound` keeps track of inbound messaging metrics, and table `internode_outbound` keeps track of the outbound messaging metrics. Both tables are in the `system_views` keyspace. Note that these are not real tables. They merely _appear_ as tables to allow access to the metrics they contain. We'll use the CQL shell to look at these tables.

✅ Start the CQL shell:
```
cqlsh
```

✅ Shows the `internode_inbound` table schema:
```
DESCRIBE TABLE system_views.internode_inbound;
```

✅ Shows the `internode_outbound` table schema:
```
DESCRIBE TABLE system_views.internode_outbound;
```

Notice that these descriptions are embedded within comments.
This is because the tables are virtual and were never actually created.

✅ Exit the CQL shell:
```
exit;
```

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

