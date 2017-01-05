#FROM stefanscherer/node-windows:7.3.0
#FROM stefanscherer/node-windows:6.9.3

#All of the above images do not work in the end - because:
#Windows Container: fs.realpathSync() is broken on shared volumes #8897
#https://github.com/nodejs/node/issues/8897

#According to stefan scherer, 4.6.0 doesn't have this problem.
#But I fail to update npm to version 3
#FROM stefanscherer/node-windows:4.6.0

#The newest release does build, but because it comes with npm@4 fails on the "npm install"
#of the sharepoint framework-project.
FROM stefanscherer/node-windows:7.4.0

SHELL ["cmd", "/S", "/C"]

EXPOSE 5432 4321 35729

#Tried the following workaround (to upgrade from npm@2 to npm@3 - but doesn't work:
#(node-windows:4.6.0)
#Install npm@3 to C:\node_modules:
#RUN npm install npm@3
#Call the new version to install it globally - but it fails nonetheless:
#RUN C:\nodejs\node.exe C:\node_modules\npm\bin\npm-cli.js install -g npm@3

RUN npm install -g npm
RUN npm install -g --production windows-build-tools
RUN npm install -g gulp
RUN npm install -g yo
RUN npm install -g @microsoft/generator-sharepoint
RUN npm cache clean

VOLUME C:/Users/app/spfx
WORKDIR /Users/app/spfx

RUN net user spfx /ADD

USER spfx

CMD cmd.exe