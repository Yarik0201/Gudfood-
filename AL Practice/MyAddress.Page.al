namespace ALProject.ALProject;

page 50101 MyAddress
{
    ApplicationArea = All;
    Caption = 'MyAddress';
    PageType = Card;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(GroupName)
            {
            }
        }

    }
    actions
    {
        area(Processing)
        {
            action(WhatsTheAddress)
            {
                ApplicationArea = All;
                Caption = 'Whats the Address?';
                ToolTip = 'Select the address.';
                Image = Addresses;
                trigger OnAction()
                var
                    iAddressProvider: Interface IAddressProvider;
                begin
                    AddressproviderFactory(iAddressProvider);
                    Message(iAddressProvider.GetAddress());
                end;
            }
            action(SendToHome)
            {
                ApplicationArea = All;
                Caption = 'Send to home';
                ToolTip = 'Set the interface implementation to Home.';
                Image = Home;
                trigger OnAction()
                begin
                    sendTo := sendTo::Private
                end;
            }
            action(SendToWork)
            {
                ApplicationArea = All;
                Image = WorkCenter;
                Caption = 'Send to Work.';
                ToolTip = 'Set the interface implementation to Work.';

                trigger OnAction()
                begin
                    sendTo := sendTo::Company
                end;
            }
        }
    }
    local procedure AddressproviderFactory(var iAddressProvider: Interface IAddressProvider)
    var
        CompanyAddressProvider: Codeunit CompanyAddressProvider;
        PrivateAddressProvider: Codeunit PrivateAddressProvider;
    begin
        if sendTo = sendTo::Company then
            iAddressProvider := CompanyAddressProvider;
        if sendTo = sendTo::Private then
            iAddressProvider := PrivateAddressProvider;
    end;

    var
        sendTo: Enum SendTo;

}
