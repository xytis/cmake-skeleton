 
How to start
============

#.  Clone template:

    ::

        git clone git://github.com/xytis/cmake-skeleton.git ${PROJECT}

    Here ``${PROJECT}`` is the directory name of your project.

#.  Change default repository. Assuming you are in project directory:

    ::

        git remote rename origin template
        git remote add origin ${REPOSITORY}
        git push -u origin master

    Here ``${REPOSITORY}`` is the URL of your public repository (at 
    `github <github.com>`_ or somewhere else).

#.  Replace ``README.rst`` with yours.

If you want to update template:

::
    
    git pull template master



.. image:: https://d2weczhvl823v0.cloudfront.net/xytis/cmake-skeleton/trend.png
   :alt: Bitdeli badge
   :target: https://bitdeli.com/free

