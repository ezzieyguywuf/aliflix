This uses lsyncd to watch a source directory and clone it to a destination. Once
the sync is done, the source directory is cleaned up. This is containerized
because I'm using it in a kubernetes cluster.
