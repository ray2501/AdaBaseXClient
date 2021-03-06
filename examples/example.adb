with Ada.Text_IO;
with Ada.Exceptions;
with AdaBaseXClient;
use Ada.Exceptions;
use AdaBaseXClient;

procedure Example is
begin

   if (Connect ("localhost", 1_984) = False) then
      Ada.Text_IO.Put_Line ("Connect failed.");
      return;
   else
      if (Authenticate ("admin", "admin") = False) then
         Ada.Text_IO.Put_Line ("Authenticate failed.");

         Close;
         return;
      end if;
   end if;

   declare
      Response : String := Execute ("xquery 1 to 10");
   begin
      Ada.Text_IO.Put_Line (Response);
   end;

   Close;

exception
   when Error : BaseXException =>
      Ada.Text_IO.Put ("Exception: ");
      Ada.Text_IO.Put_Line (Exception_Name (Error));
      Ada.Text_IO.Put (Exception_Message (Error));
end Example;
