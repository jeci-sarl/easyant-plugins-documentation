EasyAnt Plugins Documentation
=============================

There is no official documentation for EasyAnt standard plugins (org.apache.easyant.plugins) but description exist in each `module.ivy` file.

I quickly wrote  a [cocoon](http://cocoon.apache.org/) sitemap and two xslt file to generate documentation for these plugins.

Try me
------

To try this, first checkout Easyant plugins  :

    svn co https://svn.apache.org/repos/asf/ant/easyant/plugins/trunk/ easyant-plugins

Then define this path to `src/main/resources/META-INF/cocoon/properties/dev/plugins.properties`

    easyant.plugins.dir = /opt/EasyAnt/easyant-plugins/


Start jetty using maven

    mvn jetty:run

Finally you can access list of plugins documentation : http://localhost:8888/plugins.html


Todo
----

-    Adding CSS
-    Try with cocoon-cli

