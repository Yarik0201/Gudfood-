namespace ALProject.ALProject;

page 50106 "Gudfood Item Picture"
{
    ApplicationArea = All;
    Caption = 'Gudfood Item Picture';
    PageType = CardPart;
    SourceTable = "Gudfood Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Picture; Rec.Picture)
                {
                    ToolTip = 'Specifies the value of the Picture field.';
                }
            }
        }
    }
}
