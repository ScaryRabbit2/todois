BEGIN {
	FS=":";

	# statistics counter
	done_count=0;
	progress_count=0;
	pending_count=0;

	# transform glyphs into colored glyphs
	if ( color =="true" )
	{
		done=done_c done reset_c
		progress=progress_c progress reset_c
		pending=pending_c pending reset_c
	}
}
# MAIN
{
	# print id if enabled
	if ( list =="true" )
		printf "%3.d. ", $1;

	# print glyph if enabled
	if ( glyphs =="true" )
	{
		if ( $2 =="true" ) 
		{
			box=progress;
			progress_count += 1
		}
		else if ( $3 =="true" )
		{
			box=done;
			done_count += 1
		}
		else 
		{
			box=pending;
			pending_count += 1
		}

		printf " %s  ", box;
	}

	# Print the note itself
	printf "%s\n", $4
}

END {
	# print stats if enabled
	if ( stats =="true" )
	{
		# color stats if enabled
		if ( color =="true" )
		{
			done_count=done_c done_count reset_c
			progress_count=progress_c progress_count reset_c
			pending_count=pending_c pending_count reset_c
		}
		
		printf "\n%s done, %s in progress, %s pending\n", done_count, progress_count, pending_count
	}
}