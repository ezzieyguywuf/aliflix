-- lsyncd.conf.lua (to be placed in /etc/lsyncd/ inside the Docker image)

settings {
    statusFile     = "/tmp/lsyncd.status",
    nodaemon       = true, 
    insist         = true,
    inotifyMode    = "CloseWrite"
}

sync {
    default.rsync,
    source    = "/mnt/uploads-from-rsync/",
    target    = "/mnt/jellyfin-media-library/",

    rsync     = {
        archive = true,
        verbose = true,
        _extra  = { "--out-format=[%t] %o %n (%L)", "--whole-file" }
    },

    delay = 2,
    delete = 'false'
}
