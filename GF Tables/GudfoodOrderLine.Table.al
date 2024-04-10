table 50103 "Gudfood Order Line"
{
    Caption = 'Gudfood Order Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Order No."; Code[20])
        {
            Caption = 'Order No.';
            TableRelation = "Gudfood Order Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
        }
        field(3; "Sell- to Customer No."; Code[20])
        {
            Caption = 'Sell- to Customer No.';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Order Header"."Sell- to Customer No." where("No." = field("Order No.")));
        }
        field(4; "Date Created"; Date)
        {
            Caption = 'Date Created';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Order Header"."Date Created" where("No." = field("Order No.")));
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = "Gudfood Item";
            trigger OnValidate()
            var
                GudfoodItem: Record "Gudfood Item";
            begin
                if Rec."Item No." <> '' then
                    GudfoodItem.Get(Rec."Item No.");
                If GudfoodItem."Shelf Life" < Today then
                    Error('expiration date has expired');
            end;
        }
        field(6; "Item Type"; Enum "Gudfood Item Type")
        {
            Caption = 'Item Type';
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Type where(Code = field("Item No.")));
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item".Description where(Code = field("Item No.")));
        }
        field(8; Quantity; Decimal)
        {
            Caption = 'Quantity';
            trigger OnValidate()
            var
                TextErr: Label 'Quantity cannot be less then 0';
            begin
                if Quantity < 0 then
                    Error(TextErr);
                Amount := Quantity * "Unit Price";
            end;
        }
        field(9; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Gudfood Item"."Unit Price" where(Code = field("Item No.")));
            trigger OnValidate()
            begin
                Amount := Quantity * "Unit Price";
            end;
        }
        field(10; Amount; Decimal)
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
