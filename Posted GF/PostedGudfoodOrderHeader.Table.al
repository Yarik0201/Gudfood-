table 50104 "Posted Gudfood Order Header"
{
    Caption = 'Posted Gudfood Order Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                SalesSetup.Get();
                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual(SalesSetup."Posted Gudfood Order Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(3; "Sell-to Customer Name"; Text[100])
        {
            Caption = 'Sell-to Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Sell- to Customer No.")));
        }
        field(4; "Order Date"; Date)
        {
            Caption = 'Order Date';
            DataClassification = CustomerContent;
        }
        field(5; "Posting No."; Code[20])
        {
            Caption = 'Posting No.';
            DataClassification = CustomerContent;
        }
        field(6; "Date Created"; Date)
        {
            Caption = 'Date Created';
            DataClassification = CustomerContent;
        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(8; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Order No." = field("Order No.")));
        }
        field(9; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Amount where("Order No." = field("Order No.")));

        }
        field(10; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(11; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        Date: Date;
    begin
        Date := Today();
        "Posting Date" := Date;

        SalesSetup.Get();
        if "No." = '' then
            NoSeriesMgt.InitSeries(SalesSetup."Posted Gudfood Order Nos.", '', 0D, "No.", Rec."No. Series");
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
