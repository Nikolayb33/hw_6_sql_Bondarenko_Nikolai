-- задание 1 дз 
drop function times1;
DELIMITER $$
create function times1 (seconds int)
returns char(255)	
deterministic
begin
declare days char(3);
declare hours, minutes, sec char(2);
declare result char(255);


set days = cast(floor(seconds/60/60/24) as char(3));
set hours = cast(floor(mod(seconds/60/60/24,1)*24) as char(2));
set minutes = cast(floor(mod(mod(seconds/60/60/24,1)*24,1)*60) as char(2));
set sec = cast(round(mod(mod(mod(seconds/60/60/24,1)*24,1)*60,1)*60) as char(2));
set result = concat(days, "days", hours, "hours", minutes, "minutes", sec, "seconds");
return result;
end $$
DELIMITER ;

select times1(125667);-- проверка 1 задания 

-- задание 2 дз 
drop procedure input_chetn;
DELIMITER $$
CREATE PROCEDURE input_chetn()
BEGIN
DECLARE i INT default 2;
Declare result varchar(256);
set result = '';
WHILE i <= 10 do
SET result = concat(result, '  ', i);
SET i = i + 2;
END while;
select result;
end $$
DELIMITER ;

call input_chetn(); -- проверка задания 2

