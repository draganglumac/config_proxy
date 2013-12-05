config_proxy
============

Redirect proxy for automation test lab. Proxy can redirect to a locally served
config file on a node host to enable test scripts to use http stubs, change
config files on the fly etc.

The proxy polls the automation test lab database to match the incoming requests
to the nodes that are running local config servers, based on the IP address of the
device that sent the incoming request, to the node that hosts that device.

