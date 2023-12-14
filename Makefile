SERVER_STAGING := htwserver-mk
APPDIR := ~/ShinyApps/learnr_py
SERVER_STAGING_APP := $(SERVER_STAGING):$(APPDIR)
RSYNC_COMMON := -rcv --exclude-from=.rsyncexclude

sync:
	rsync $(RSYNC_COMMON) . $(SERVER_STAGING_APP)

testsync:
	rsync $(RSYNC_COMMON) -n . $(SERVER_STAGING_APP)

reload:
	ssh $(SERVER_STAGING) 'touch $(APPDIR)/restart.txt'

installdeps:
	ssh $(SERVER_STAGING) 'cd $(APPDIR) && R -e "renv::restore()"'

