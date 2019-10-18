-- Prabhas Kumra
-- HW 6



-- 1

Drop PROCEDURE if exists add_order;

delimiter ;;
create procedure add_order (in ono int(4), in cno int(4), in eno int(4),
in received varchar(10))
begin
    if(received is null) then
        insert into Orders (ONO, CNO, ENO, RECEIVED, SHIPPED) values
        (ono, cno, eno, CURDATE(), NULL);
    else
        insert into Orders (ONO, CNO, ENO, RECEIVED, SHIPPED) values
        (ono, cno, eno, received, NULL);
    end if;
end ;;

delimiter ;


-- 2


drop procedure if exists add_order_details;

delimiter ;;

create PROCEDURE add_order_details (in ono int(4), in pno int(4), in qty int(5))
begin 
    if( qty < (select QTY from Odetails where PNO = pno) ) then
        insert into odetails_errors(transactions, ONO, PNO, messages) values
        (CURDATE(), ono, pno, 'ERROR INSERTING');
    else 
        UPDATE Odetails set QTY = QTY - qty where PNO = pno;

        if((select QTY from Odetails where PNO = pno) < qty) then
            INSERT into restock (transactions, PNO) VALUES
            (CURDATE(), pno);
        END if;
        
    END if;
END;;

delimiter ;




-- 3

drop procedure if exists ship_order;

delimiter ;;

create procedure ship_order (in ono int(4), in shipped varchar(9))
begin
    if ((select SHIPPED from Orders where ONO = ono) is null) then
            Update Orders set SHIPPED = CURDATE() where ONO = ono;
        else
            Update Orders set SHIPPED = shipped where ONO = ono;
    end if;
end ;;

delimiter ;

