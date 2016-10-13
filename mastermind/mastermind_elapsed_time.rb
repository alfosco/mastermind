start = Time.now
finish = Time.now
diff = finish - start
secs = diff
mins = secs / 60

  if mins >= 1
    "#You took {mins.round} minutes and #{(secs % 60).round} seconds"
  elsif secs >= 0
    "#You took {secs.round} seconds"
  end