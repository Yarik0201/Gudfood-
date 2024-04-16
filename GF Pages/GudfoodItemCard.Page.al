namespace ALProject.ALProject;

page 50104 "Gudfood Item Card"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Card';
    PageType = Card;
    SourceTable = "Gudfood Item";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Qty. Ordered"; Rec."Qty. Ordered")
                {
                    ToolTip = 'Specifies the value of the Qty. Ordered field.';
                }
                field("Qty. in Order"; Rec."Qty. in Order")
                {
                    ToolTip = 'Specifies the value of the Qty. in Order field.';
                }
                field("Shelf Life"; Rec."Shelf Life")
                {
                    ToolTip = 'Specifies the value of the Shelf Life field.';
                }
                field(Picture; Rec.Picture)
                {
                    ToolTip = 'Specifies the value of the Picture field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(PictureFactbox; "Gudfood Item Picture")
            {
                SubPageLink = Code = field(Code);
            }
        }
    }
}
