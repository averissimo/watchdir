#!/bin/bash

TEST=$1
RC_FILE=~/.watchdirrc

if [ -f $RC_FILE ]; then
	. $RC_FILE
else
	echo "please create $RC_FILE (see watchdirrc.example)"
	exit
fi

for j in $PARENT_DIR/*; do
	g=${j#*$PARENT_DIR/}
	for i in $j/*.$SUFFIX; do
		if echo "$i" | grep -q "*"; then
			echo "nothing to do here ($i)..."  
		else
			# removes .added suffix
			t=${i%.$SUFFIX}
			# removes directory hierarchy prefix, leaving only the torrent name
			f=${t#*$j/}
			if [ -f "$i" ]; then
				# adds .added file to dropbox folder 
				if [ -z $TEST ] ; then
					#$EXEC upload "$i" "$REMOTE_ADDED_DIR/$f.added"
					# removes .added file from disk
					echo "rm $i"
					rm "$i"
				else
					#echo "$EXEC upload \"$i\" \"$REMOTE_ADDED_DIR/$f.added\""
					echo "rm $i"
				fi
			fi
			# removes torrent from dropbox (there's no need to remove from local disk)
			if [ -z $TEST ] ; then
				$EXEC remove "$REMOTE_PARENT_DIR/$g/$f"
			else
				echo "$EXEC remove \"$REMOTE_PARENT_DIR/$g/$f\""
			fi
		fi
	done
	# refresh the local folder with remote dropbox files
	if [ -z $TEST ] ; then
		$EXEC download "$REMOTE_PARENT_DIR/$g" "$PARENT_DIR"
	else
		echo "$EXEC download \"$REMOTE_PARENT_DIR/$g\" \"$PARENT_DIR\""
	fi
done
if [ -f $ADDED_LOG ]; then
	$EXEC upload $ADDED_LOG $REMOTE_TOP_PARENT
fi

if [ -f $COMPLETED_LOG ]; then
	$EXEC upload $COMPLETED_LOG $REMOTE_TOP_PARENT
fi
