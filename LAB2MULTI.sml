
fun is_older (x:int*int*int,y:int*int*int) = 
if #1 x < #1 y then true else
if #1 x > #1 y then false else
if #2 x < #2 y then true else
if #2 x > #2 y then false else
if #3 x < #3 y then true else
if #3 x > #3 y then false else
false;




fun number_in_month ([],_):int = 0
|   number_in_month (a::x: (int*int*int) list,y: int): int =
if #2 a = y then 1+ number_in_month(x,y)
else number_in_month(x,y);





fun number_in_monthsR ([],b::y: int list):int = 0
|   number_in_monthsR (_,[]) = 0
|   number_in_monthsR (a::x: (int*int*int) list,b::y: int list):int = 
if #2 a = b then 1
else  number_in_monthsR(a::x,y);


fun number_in_months ([],b::y: int list):int = 0
|   number_in_months (_,[]) = 0
|   number_in_months (a::x: (int*int*int) list,b::y: int list) =
if #2 a = b then 1+ number_in_months(x,b::y)
else  number_in_monthsR(a::x,y)+number_in_months(x,b::y);

number_in_months([(1,2,3),(1,2,3),(1,2,3),(1,2,3),(1,2,3),(1,2,3),(1,2,3)],[3,1,4,2]);




fun date_in_month ([],_): (int*int*int) list = []
|   date_in_month (a::x: (int*int*int) list,y: int): (int*int*int) list =
if #2 a = y then a::date_in_month(x,y)
else date_in_month(x,y);
date_in_month([(1,1,3),(1,4,3),(1,3,3),(1,2,3),(1,2,3),(1,3,3),(1,2,3)],3);






fun date_in_monthsR ([],b::y: int list): (int*int*int) list = []
|   date_in_monthsR (_,[]) = []
|   date_in_monthsR (a::x: (int*int*int) list,b::y: int list) = 
if #2 a = b then [a]
else  date_in_monthsR(a::x,y);


fun date_in_months ([],b::y: int list): (int*int*int) list = []
|   date_in_months (_,[]) = []
|   date_in_months (a::x: (int*int*int) list,b::y: int list) =
if #2 a = b then a::date_in_months(x,b::y)
else  date_in_monthsR(a::x,y)@date_in_months(x,b::y);

date_in_months([(1,2,3),(1,4,3),(1,2,3),(1,2,3),(1,3,3),(1,1,3),(1,2,3)],[3,4,2]);

fun get_nth ([],_):string=""
| get_nth (s:string list, n:int ) =
if(n<2) then hd s 
else get_nth(tl s,n-1);

get_nth(["sss","ww","asd"],2);

fun date_to_string ( date1, date2, date3):string =
  let 
  val months = ["January ","February ","March ","April ","May ","June ","July ","August ","September ","October ","November ","December "] in
    get_nth(months,date2)^Int.toString(date3)^", "^Int.toString(date1)
  end;
date_to_string(2002,04,28);



fun number_before_reaching_sum(_, []):int = 0
| number_before_reaching_sum(sum:int, numbers: int list) = 
let 

fun addall ([]) = 0
| addall (numbers: int list) =
hd numbers + addall(tl numbers)

fun helper(i:int , _ ,[]):int = i
|   helper (i : int, partial_sum : int, tl_numbers : int list) =
        if addall(tl tl_numbers)<sum then i-1
        else
		if partial_sum- hd tl_numbers < 0  then i
                else
		    helper(i + 1, partial_sum - hd tl_numbers, tl tl_numbers)

in

if (sum - hd numbers>0 andalso addall(numbers)>=sum) then
    helper(1, sum-hd numbers, numbers)
    else
    0
    end;



number_before_reaching_sum(4,[3,10,1,1,1]);




fun what_month(day:int):int =
let 
val months = [31,28,31,30,31,30,31,31,30,31,30,31,1001]
in
if day>0 andalso day<366 then
number_before_reaching_sum(day,months)+1
else
0
end;
what_month(32);

fun month_range (day1:int, day2:int):int list =
if day1>day2 then
[]
else
if (day1=day2) then
[what_month(day1)]
else
[what_month(day1)]@month_range(day1+1,day2);

fun is_oldest (dates: (int*int*int) list ) =
let 
fun helper(date:(int*int*int),dates: (int*int*int) list)=
if null dates then SOME date
else
if (is_older(date,hd dates)) then
helper(date,tl dates)
else
helper(hd dates,tl dates)
in

if null dates then NONE 
else
helper(hd dates,tl dates)
end;
is_oldest([(1,2,3),(1,2,3),(0,2,3),(1,3,3),(1,2,3),(1,2,3),(1111,3,3),(1,2,3)]);