table 50102 "Gudfood Order Header"
{
    Caption = 'Gudfood Order Header';


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            NotBlank = false;

            trigger OnValidate()
            begin
                SalesSetup.Get();
                if "No." <> xRec."No." then begin
                    NoSeriesMgt.TestManual(SalesSetup."Gudfood Order Nos.");
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
            Editable = false;
            trigger OnValidate()
            begin
                SalesSetup.Get();
                if "Posting No." <> xRec."Posting No." then begin
                    NoSeriesMgt.TestManual(SalesSetup."Posted Gudfood Order Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(6; "Date Created"; Date)
        {
            Caption = 'Date Created';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(7; "Total Qty"; Decimal)
        {
            Caption = 'Total Qty';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Order No." = field("No.")));
        }
        field(8; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Amount where("Order No." = field("No.")));

        }
        field(9; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
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
        "Date Created" := Date;

        SalesSetup.Get();
        if "No." = '' then
            NoSeriesMgt.InitSeries(SalesSetup."Gudfood Order Nos.", '', 0D, "No.", Rec."No. Series");

        SalesSetup.Get();
        if "Posting No." = '' then
            NoSeriesMgt.InitSeries(SalesSetup."Posted Gudfood Order Nos.", '', 0D, "Posting No.", Rec."No. Series");
    end;

    trigger OnDelete()
    begin

    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;

}
