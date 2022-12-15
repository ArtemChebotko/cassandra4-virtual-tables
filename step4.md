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
 <a href='command:katapod.loadPage?[{"step":"step3"}]'
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 4 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step5"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Explore client connections</div>

Now, we want to look at the clients currently connected to this node through CQL.

✅ This is done by querying the virtual table `system_views.clients`:
```
### cqlsh
SELECT port, connection_stage, 
       driver_name, protocol_version, 
       username 
FROM clients ;
```

Wait a minute ... what are these clients?

It turns out that `cqlsh` uses the Python driver.
This driver keeps two connections alive on two different ports
(the port numbers are chosen dynamically).
So you are simply looking at the connection between your own `cqlsh`
and the node.

Let's create more connections. 
Before we begin, make sure that the message in `python-terminal` says `Cassandra driver successfully installed.`

✅ First, let's start a Python interpreter console (or _REPL_) and connect to the
node from there. Start the Python interpreter in `python-terminal`:
```
### python
python3
```

✅ Next, import the Python drivers and use them to connect to the local node
(which is the default connection, so you don't need to provide IP addresses):
```
### python
from cassandra.cluster import Cluster
cluster = Cluster(protocol_version=4)
session = cluster.connect()
```

✅ In the Python REPL, try the following loop - which achieves the same effect
as the query you ran earlier in `cqlsh` - **press Enter** to
make it run:
```
### python
rows = session.execute('SELECT port, connection_stage, driver_name, protocol_version FROM system_views.clients')
for row in rows:
    print('%5i  %8s  %36s  %2i' % (
        row.port, row.connection_stage,
        row.driver_name, row.protocol_version
    ))
```

How many rows are there? Look at the ports used and the protocol versions.
Notice that the latter matches the required version specified a few lines above,
when creating the `Cluster` object (`protocol_version=4`).

✅ Suppose you want to make sure all your clients have been upgraded to the
more recent protocol (version 5). Check by issuing, in `cqlsh`,
the following command (note its `WHERE` clause):
```
### cqlsh
SELECT address, protocol_version, username 
FROM clients 
WHERE protocol_version < 5 ALLOW FILTERING ;
```

Recall that for virtual tables there's no need to worry about
full-cluster scans.

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step3"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step5"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>

