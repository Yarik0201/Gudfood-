namespace ALProject.ALProject;

codeunit 50103 PrivateAddressProvider implements IAddressProvider
{

    procedure GetAddress(): Text
    begin
        exit('My home address \ Denmark 2800')
    end;

}
