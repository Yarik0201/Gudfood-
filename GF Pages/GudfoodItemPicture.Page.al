namespace ALProject.ALProject;
using System.IO;
using Gudfood.Gudfood;

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
    actions
    {

        area(Processing)
        {

            action(ImportPicture)
            {
                ApplicationArea = All;
                Caption = 'Add image';
                Image = Import;
                ToolTip = 'Import a picture file.';

                trigger OnAction()
                var
                    ImportFile: Codeunit "Import File";
                begin
                    ImportFile.ImportItemPicture(Rec);
                end;

            }
            action(DeletePicture)
            {
                ApplicationArea = All;
                Caption = 'Delete image';
                Image = Delete;
                ToolTip = 'Delete a picture of an item.';

                trigger OnAction()
                var
                    ImportFile: Codeunit "Import File";
                begin
                    ImportFile.DeleteItem(Rec);
                end;
            }
        }

    }

}