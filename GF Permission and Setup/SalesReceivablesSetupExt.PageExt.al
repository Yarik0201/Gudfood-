namespace ALProject.ALProject;

using Microsoft.Sales.Setup;

pageextension 50100 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Dynamics 365 Sales")
        {
            group("Gudfood Item")
            {
                Caption = 'Gudfood Item';
                field("Gudfood Items Nos."; Rec."Gudfood Items Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Allow to create new series of numbers';
                    Caption = 'Gudfood Items Nos.';
                }
                field("Gudfood Order Nos."; Rec."Gudfood Order Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Allow to create new series of numbers';
                    Caption = 'Gudfood Order Nos.';
                }
                field("Posted Gudfood Order Nos."; Rec."Posted Gudfood Order Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Allow to create new series of numbers';
                    Caption = 'Posted Gudfood Order Nos.';
                }
            }
        }
    }
}
