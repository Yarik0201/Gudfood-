namespace ALProject.ALProject;

using Microsoft.Sales.Customer;

tableextension 50110 SMACustomer extends Customer
{
    fields
    {
        field(50100; Facebook; Text[50])
        {
            Caption = 'Facebook';
            DataClassification = CustomerContent;
        }
        field(50101; "X, formerly Twitter"; Text[30])
        {
            Caption = 'X, formerly Twitter';
            DataClassification = CustomerContent;
        }
        field(50102; Instagram; Text[50])
        {
            Caption = 'Instagram';
            DataClassification = CustomerContent;
        }
        field(50103; LinkedIn; Text[50])
        {
            Caption = 'LinkedIn';
            DataClassification = CustomerContent;
        }
    }
}
