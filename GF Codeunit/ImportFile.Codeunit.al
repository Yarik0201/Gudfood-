namespace Gudfood.Gudfood;

codeunit 50101 "Import File"
{
    procedure ImportItemPicture(Item: Record "Gudfood Item")
    var
        PicInStream: InStream;
        FromFileName: Text;
        RepPic: Label 'The existing picture will be replaced. Do you want to continue?';

    begin
        if Item.Picture.HasValue() then
            if not Confirm(RepPic) then
                exit;

        if File.UploadIntoStream('Import', '', 'All Files (*.*)|*.*',
                                FromFileName, PicInStream) then begin
            Clear(Item.Picture);
            Item.Picture.ImportStream(PicInStream, FromFileName);
            Item.Modify(true);

        end;
    end;

    procedure DeleteItem(Item: Record "Gudfood Item")
    var
        DeleteImageQst: Label 'Are you sure you want to delete the picture?';
    begin
        Item.TestField(Code);
        if not Confirm(DeleteImageQst) then
            exit;
        Clear(Item.Picture);
        Item.Modify(true);
    end;
}
