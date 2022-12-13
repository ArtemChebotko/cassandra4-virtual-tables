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
 <a href='command:katapod.loadPage?[{"step":"step2"}]' 
   class="btn btn-dark navigation-top-left">⬅️ Back
 </a>
<span class="step-count"> Step 3 of 7</span>
 <a href='command:katapod.loadPage?[{"step":"step4"}]' 
    class="btn btn-dark navigation-top-right">Next ➡️
  </a>
</div>

<!-- CONTENT -->

<div class="step-title">Cleaning up technical debt</div>

Besides changing the way threads receive messages, Cassandra developers did a lot of cleanup and tuning of the internode message code path.

As developers work on code and make changes, sometimes the code can become a bit brittle or inefficient.
Developers refer to this as _Technical Debt_.

It's good to retire technical debt by refactoring or cleaning up the code, and that is exactly what developers did with the internode message code for the 4.x release.
The benefits of retiring technical debt include:
* More efficient code, which means the code requires less processing
* Code that is easier to read and understand so future changes are easier
* Code that is more robust, yielding faster and more predictable response times

The Cassandra 4.x cleanup includes:
* Protocol improvements that remove redundant information and make the protocol more efficient
* Handling corner cases where code didn't deal gracefully with exceptions
* Buffer optimization that reduces memory requirements due to internode messaging
* Introduction of messaging timeouts under certain conditions
* Optimizations that allow a node to bypass long code paths when sending messages to itself

The bottom line for these changes is Cassandra is faster, more efficient and more robust!

<!-- NAVIGATION -->
<div id="navigation-bottom" class="navigation-bottom">
 <a href='command:katapod.loadPage?[{"step":"step2"}]'
   class="btn btn-dark navigation-bottom-left">⬅️ Back
 </a>
 <a href='command:katapod.loadPage?[{"step":"step4"}]'
    class="btn btn-dark navigation-bottom-right">Next ➡️
  </a>
</div>
