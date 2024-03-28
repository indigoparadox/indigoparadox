divert(-1)
changecom()
changequote(`[', `]') 
include([iwz_html.m4])
define([iwz_title], [Mikrotik Scripts])
define([iwz_section], [projects])
divert(0)include([header.m4])

iwz_sect([Replicate DNS])

iwz_p( [This script will gather the local static DNS records, SSH into another Mikrotik router, and add each one to that router. It can be used from a scheduled task as a lightweight DNS replication in environments with multiple Mikrotik routers, providing more than one DNS server to clients.] )

iwz_p([Before using this script, a SSH private key for the opposite router should be uploaded and added under Users / Private SSH keys. iwz_b([The private key should be created with ssh-keygen -m pem for the uploader to work properly!])])

iwz_diff(
	[replicate-dns], [
	iwz_diffl([a], [1], [foreach i in=[[/ip dns static find] do={]])
	iwz_diffl([a], [2], [   # Grab the properties of this entry.])
	iwz_diffl([a], [3], [ 	:local dreg [[/ip dns static get $i regex]]])
	iwz_diffl([a], [4], [ 	:local dcom [[/ip dns static get $i comment]]])
	iwz_diffl([a], [5], [ 	:local dadd [[/ip dns static get $i address]]])
	iwz_diffl([a], [6], [ 	:local dnam [[/ip dns static get $i name]]])
	iwz_diffl([a], [7], [ 	:local dregSafe ""])
	iwz_diffl([a], [8], [])
	iwz_diffl([a], [9], [ 	# Go by name by default.])
	iwz_diffl([a], [10], [ 	:local syncom "/ip dns static add address=$dadd name=$dnam"])
	iwz_diffl([a], [11], [ 	:if ( [[:len $dnam]] = 0 ) do={])
	iwz_diffl([a], [12], [ 	   # Name len is 0 so use regex.])
	iwz_diffl([a], [13], [])
	iwz_diffl([a], [14], [ 	   # Encode dollar signs or they'll mess up in transmission.])
	iwz_diffl([a], [15], [ 	   :for i from=0 to=([[:len $dreg]] - 1) do={])
	iwz_diffl([a], [16], [ 	      :local char [[:pick $dreg $i]]])
	iwz_diffl([a], [17], [ 	      :if ( $char = "\$" ) do={])
	iwz_diffl([a], [18], [ 	         :set $char "\\\$"])
	iwz_diffl([a], [19], [ 	      }])
	iwz_diffl([a], [20], [ 	      :set $dregSafe ( $dregSafe . $char )])
	iwz_diffl([a], [21], [ 	   }])
	iwz_diffl([a], [22], [])
	iwz_diffl([a], [23], [ 	   # Construct remote command.])
	iwz_diffl([a], [24], [ 	   :set syncom "/ip dns static add address=$dadd regex=\"$dregSafe\""])
	iwz_diffl([a], [25], [   }])
	iwz_diffl([a], [26], [])
	iwz_diffl([a], [27], [   # Execute command remotely.])
	iwz_diffl([a], [28], [   :put $syncom])
	iwz_diffl([a], [29], [   /system ssh-exec user=admin charle command=$syncom])
	iwz_diffl([a], [30], [}])
	iwz_diffl([a], [31], [:log info "dns replication complete!"])
])

iwz_sect([Check URL Status])

iwz_p( [This script uses error reporting to provide a basic availability check for a URL. It would be useful to call this from a scheduled task. iwz_b([Please note that a 301 or other redirect counts as an error, so make sure to expand all URLs to their final expected destination!])] )

iwz_p([Before using, you must replace iwz_var([example.com]) with the URL to check and iwz_var([admin@example.com]) with the address to send reports to.])
 
iwz_diff(
	[check-url],
	iwz_diffl([a], [1], [do {])
   iwz_diffl([a], [2], [   /tool fetch url="https://example.com" as-value output=user])
	iwz_diffl([a], [3], [} on-error={])
	iwz_diffl([a], [4], [   /tool e-mail send to="admin@example.com" subject="[WARNING] example.com DOWN" body="example.com is not available!"])
	iwz_diffl([a], [5], [}])
)

include([footer.m4])

