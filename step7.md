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
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 7 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"finish"}]'
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Do the metrics add up?</div>

Since there are only two nodes, you would expect that the number of bytes sent from one node should be equal to the number of bytes received by the other node. Let's see if we can demonstrate that.

✅ Get inbound metrics from the first node and outbound metrics from the second node:
```
cqlsh localhost 9042 -e "SELECT received_count, received_bytes FROM system_views.internode_inbound;" &
cqlsh localhost 9043 -e "SELECT sent_count, sent_bytes FROM system_views.internode_outbound;"
```

We are only looking at two fields: the number of operations and the number of bytes.
Isolating these metrics makes it a little easier to compare the results across nodes.

Often, the number of bytes written will exceed the number of bytes read.
You can make sense of this by considering the number of operations.
You see that the number of write operations often exceeds the number of read operations (until the read node catches up).

Re-run the queries (by clicking above) until the number of operations is the same for both nodes.
You see that the number of bytes transferred also matches.

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step6"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"finish"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

