namespace ALProject.ALProject;

using Microsoft.Sales.Setup;
using Microsoft.Foundation.NoSeries;

tableextension 50101 "Sales & Receivables Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; "Gudfood Items Nos."; Text[20])
        {
            Caption = 'Gudfood Items Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50101; "Gudfood Order Nos."; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Gudfood Order Nos.';
            TableRelation = "No. Series";
        }
        field(50102; "Posted Gudfood Order Nos."; Text[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Posted Gudfood Order Nos.';
            TableRelation = "No. Series";
        }
    }
}
