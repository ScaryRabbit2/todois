BEGIN { FS=":"; flag = 0; }
{
	# found id
	if ( $1 ==find )
	{
		# already in desired state -> set to unchecked
		if ( $2 == progress && $3 == done )
		{
			flag = 2;
			printf "%s:false:false:%s\n", $1, $4 >> file
		}
		else
		{
			flag = 1;
			printf "%s:%s:%s:%s\n", $1, progress, done, $4 >> file
		}
	}
	else print $0 >> file
}
END {
	if ( flag == 1 )
		printf "Task %s %s\n", find, on
	else if ( flag == 2 )
		printf "Task %s %s\n", find, off
	else
		printf "Task number %s does not exist\n", find
}