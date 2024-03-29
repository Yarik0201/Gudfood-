table 50105 "Posted Gudfood Order Line"
{
    Caption = 'Posted Gudfood Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Posted Gudfood Order Header";
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Gudfood Order Header"."Sell- to Customer No." where("Order No." = field("Order No.")));
        }
        field(5; "Date Created"; Date)
        {
            Caption = 'Date Created';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Posted Gudfood Order Header"."Date Created" where("Order No." = field("Order No.")));
        }
        field(6; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Gudfood Item";
        }
        field(7; "Item Type"; Enum "Gudfood Item Type")
        {
            Caption = 'Item Type';
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Type where(Code = field("Item No.")));
        }
        field(8; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Description where(Code = field("Item No.")));
        }
        field(9; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(10; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item"."Unit Price" where(Code = field("Item No.")));
        }
        field(11; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Order No.", "Line No.")
        {
            Clustered = true;
        }
    }
}