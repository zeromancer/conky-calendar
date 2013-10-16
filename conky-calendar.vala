/*
    Conky-Calendar prints a calendar with left margin spacing.
    Copyright (C) 2013 David Siewert

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

public static int get_number_of_days(int year, int month) {
  bool isLeap = ((year % 4) == 0 && ((year % 100) != 0 || (year % 400) == 0));
  int[] days = {31, (isLeap ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
  return days[month];
}
public static int headline(string left_margin){
	print("%s%3s%3s%3s%3s%3s%3s%3s\n",left_margin,"Mo","Tu","We","Th","Fr","Sa","Su");
	return 0;
}

public static int return_result(string output){
	print("%s\n",output);
	return 0;
}

int main (string[] args) {
	
	string left_margin = "   ";
	
	if("headline" in args)
		return headline(left_margin);
	
	string result = "\n";
	
	var now = new DateTime.now_local();
	
	int day_of_week = now.get_day_of_week();
	int day_of_month = now.get_day_of_month();
	int number_days = get_number_of_days(now.get_year(),now.get_month());
	//print("%d , %d, %d\n",day_of_month,day_of_week,number_days);
	
	int j = day_of_month;
	int starting_day_of_week = day_of_week;
	while(j!=1){
		j--;
		starting_day_of_week--;
		if(starting_day_of_week == 0)
			starting_day_of_week = 7;
	}
	
	
	int i = 0;
	int x = starting_day_of_week-1;
	int y = 1;
	
	//print("%d , %d\n",i,starting_day_of_week);
	result += left_margin;
	for(int k = 0; k < x; k++)
		result += "%3s".printf("");
	
	i++;
	while(i<number_days+1){
		
		if(i < day_of_month)
			result += "%3s".printf("x");
		else if (i == day_of_month)
			if("before" in args)
				return return_result(result);
			else if("now" in args)
				return return_result("%3d".printf(i));
			else if("after" in args)
				result = "";
			else
				print("ERROR");
		else
			result += "%3d".printf(i);
			
		i++;
		x++;
		if(x==7){
			x = 0;
			y = y + 1;
			result += "\n"+left_margin;
		}
	}
	
	print("%s\n",result);
	
	return 0;
}
