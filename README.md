# docker-spfx-windows

This is an attempt to create windows docker images for working with SharePoint Framework.

This is based on linux docker images here:
https://github.com/waldekmastykarz/docker-spfx

I tried to do the same with windows containers (based on community nodejs docker images for windows - at the moment there are no official images).
At the moment this is not working, either because there is still a bug which does not allow for volume mounting - or there are version problems with node/npm and sharepoint framework drop 6.

Because I invested a lot of time trying to get this to work - i uploaded my Dockerfile here so anybody interested can use it at a later date.

If there are official docker nodejs windows images this should be resumed.
And if it's working would make more sense to create a pull request for [docker-spfx](https://github.com/waldekmastykarz/docker-spfx).