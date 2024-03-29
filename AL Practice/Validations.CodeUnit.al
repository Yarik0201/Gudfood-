codeunit 50101 Validations
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, OnBeforeValidateEvent, Address, false, false)]
    local procedure TableCustomerOnAfterValidateEventAddress(var Rec: Record Customer)
    begin
        CheckForPlusSign(Rec.Address);
    end;

    local procedure CheckForPlusSign(TextToVerify: Text)
    begin
        if TextToVerify.Contains('+') then
            Message('A + sign has been found.');
    end;
}