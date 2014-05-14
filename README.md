EasyAnt Plugins Documentation
=============================

There is no official documentation for [Apache EasyAnt](http://ant.apache.org/easyant/) standard plugins (org.apache.easyant.plugins) but description exist in each `module.ivy` file.

I quickly wrote  a [cocoon](http://cocoon.apache.org/) sitemap and two xslt file to generate documentation for these plugins.

Try me
------

To try this, first checkout Easyant plugins  :

    svn co https://svn.apache.org/repos/asf/ant/easyant/plugins/trunk/ data/easyant-plugins
    svn co https://svn.apache.org/repos/asf/ant/easyant/buildtypes/trunk/ data/easyant-buildtypes
    svn co https://svn.apache.org/repos/asf/ant/easyant/skeletons/trunk/ data/easyant-skeletons
    svn co https://svn.apache.org/repos/asf/ant/easyant/tasks/trunk/ data/easyant-tasks

Then define this path to `src/main/resources/META-INF/cocoon/properties/dev/plugins.properties`

    easyant.plugins.dir = /opt/EasyAnt/easyant-plugins/


Start jetty using maven

    mvn jetty:run

Finally you can access list of plugins documentation : http://localhost:8888/plugins.html


Todo
----

-    Try with cocoon-cli
-    adding link to `<module-name>.ant` file
-    adding link to other ressources files (see `documentation` plugin)
-    update doc to upload data from http://repository.easyant.org/apache-easyant/ ?
-    list also buildtypes
-    add more on homepage
-    add link to official documentation