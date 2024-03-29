table 50101 "Gudfood Item"
{
    Caption = 'Gudfood Item';
    DataClassification = CustomerContent;
    LookupPageId = "Gudfood Item List";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = false;
            trigger OnValidate()
            begin
                SalesSetup.Get();
                if Code <> xRec.Code then begin
                    NoSeriesMgt.TestManual(SalesSetup."Gudfood Items Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(4; "Type"; Enum "Gudfood Item Type")
        {
            Caption = 'Type';
        }
        field(5; "Qty. Ordered"; Decimal)
        {
            Caption = 'Qty. Ordered';
            FieldClass = FlowField;
            CalcFormula = sum("Posted Gudfood Order Line".Quantity where("Item No." = field(Code)));
            Editable = false;
        }
        field(6; "Qty. in Order"; Decimal)
        {
            Caption = 'Qty. in Order';
            FieldClass = FlowField;
            CalcFormula = sum("Gudfood Order Line".Quantity where("Item No." = field(Code)));
            Editable = false;
        }
        field(7; "Shelf Life"; Date)
        {
            Caption = 'Shelf Life';
        }
        field(8; Picture; Media)
        {
            Caption = 'Picture';
        }
        field(9; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }

    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, Description, Type)
        {

        }
    }
    trigger OnInsert()
    var
    begin
        SalesSetup.Get();
        if Code = '' then
            NoSeriesMgt.InitSeries(SalesSetup."Gudfood Items Nos.", '', 0D, Code, Rec."No. Series");
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
