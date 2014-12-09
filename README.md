node-coffee-shellscript-boilerplate
===================================

an starting point for writing cross-platform shellscripts with node.js and coffeescript. Get started in a minute.

This package bundles some small modules which are a good use when you are attempting to write a shellscript or the like using node. I used python for writing such small things, but python is hard to deploy in windows enviroments. A small node.exe along with a small script is much easier to deploy. But node hasn't the batteries includes, so we need boilerplate to get up fast. Which is why this repository exists.

Ready-to-go Packages are:
    * commander
    * inquirer
    * shelljs

You need node.js and npm installed. 

1. clone this repository
    
    ```   
    git clone https://github.com/andik/node-coffee-shellscript-boilerplate.git
    ```


2. install dependencies
    
    ```
    npm install
    ```

3. build with grunt

4. deploy your skript

    ```
    grunt bundle
    ```

which creates a `bundle.js` which includes all dependencies and is easy to distribute along with a node.exe and a small batchfile to start the skript.