namespace ALProject.ALProject;

page 50105 "Gudfood Item List"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item List';
    PageType = List;
    CardPageId = "Gudfood Item Card";
    SourceTable = "Gudfood Item";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
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

            }
        }
    }
}
