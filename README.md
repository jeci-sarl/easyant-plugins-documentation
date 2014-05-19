EasyAnt Plugins Documentation
=============================

There is no official documentation for [Apache EasyAnt](http://ant.apache.org/easyant/) standard plugins (org.apache.easyant.plugins) but description exist in each `module.ivy` file.

I quickly wrote  a [cocoon](http://cocoon.apache.org/) sitemap and two xslt file to generate documentation for these plugins.

Try me
------

To try this, first checkout this code and all Easyant plugins  :

    git clone https://github.com/jeci-sarl/easyant-plugins-documentation.git
    cd easyant-plugins-documentation
    
    svn co https://svn.apache.org/repos/asf/ant/easyant/plugins/trunk/ data/easyant-plugins
    svn co https://svn.apache.org/repos/asf/ant/easyant/buildtypes/trunk/ data/easyant-buildtypes
    svn co https://svn.apache.org/repos/asf/ant/easyant/skeletons/trunk/ data/easyant-skeletons
    svn co https://svn.apache.org/repos/asf/ant/easyant/tasks/trunk/ data/easyant-tasks

Then define this path to `src/main/resources/META-INF/cocoon/properties/dev/plugins.properties`

    data.dir = /opt/EasyAnt/cocoon-plugins-documentation/data

Start jetty using maven

    mvn jetty:run

Finally you can access list of plugins documentation : [http://localhost:8888/](http://localhost:8888/)


Todo
----

-    Try with cocoon-cli
-    update doc to upload data from http://repository.easyant.org/apache-easyant/ ?
-    add more on homepage
-    add link to official documentation
-    correct link to `<module-name>.ivy` and `<module-name>.ant` files