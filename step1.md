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
 <a href='command:katapod.loadPage?[{"step":"intro"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 1 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step2"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Check the environment</div>

The environment has a single-node Cassandra cluster. 
We will interact with Cassandra by executing commands in the three terminals:
* `bash-terminal` is for using utilities like `nodetool` and `grep`;
* `cqlsh-terminal` is for executing CQL statements using a CQL shell;
* `python-terminal` is for interacting with Cassandra via a Python client using a Cassandra driver. 

_Wait until the Cassandra cluster is successfully started._

✅ Use `nodetool` in `bash-terminal` to verify that Cassandrais is running:
```
### bash
nodetool status
```

The output should show that the current node (which forms a cluster by itself)
is in a status `UN` (meaning Up and Normal). 


<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"intro"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step2"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>
