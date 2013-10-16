all:
		valac --target-glib=2.36 *.vala -o conky-calendar

clean:
		rm -rf *.o conky-calendar
