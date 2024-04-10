namespace ALProject.ALProject;

codeunit 50104 "Copy Function"
{
    trigger OnRun()

    begin

    end;

    procedure CopyToPosted(GudfoodOrderHeader: Record "Gudfood Order Header")
    begin
        PostedGudfoodOrderHeader.Init();
        PostedGudfoodOrderHeader."No." := GudfoodOrderHeader."Posting No.";
        PostedGudfoodOrderHeader."Sell- to Customer No." := GudfoodOrderHeader."Sell- to Customer No.";
        PostedGudfoodOrderHeader."Order Date" := GudfoodOrderHeader."Order Date";
        PostedGudfoodOrderHeader."Posting No." := GudfoodOrderHeader."Posting No.";
        PostedGudfoodOrderHeader."Date Created" := GudfoodOrderHeader."Date Created";
        PostedGudfoodOrderHeader."Order No." := GudfoodOrderHeader."No.";
        PostedGudfoodOrderHeader.Insert(true);
        GudfoodOrderHeader.Delete();

        GudfoodOrderLine.SetRange("Order No.", GudfoodOrderHeader."No.");
        if GudfoodOrderLine.FindSet() then begin
            repeat
                PostedGudfoodOrderLine.Init();
                PostedGudfoodOrderLine."Order No." := GudfoodOrderLine."Order No.";
                PostedGudfoodOrderLine."Line No." := GudfoodOrderLine."Line No.";
                PostedGudfoodOrderLine."Item No." := GudfoodOrderLine."Item No.";
                PostedGudfoodOrderLine.Quantity := GudfoodOrderLine.Quantity;
                PostedGudfoodOrderLine.Amount := GudfoodOrderLine.Amount;
                PostedGudfoodOrderLine.Insert(true);
            until GudfoodOrderLine.Next() = 0;
            GudfoodOrderLine.SetRange("Order No.", GudfoodOrderHeader."No.");
            GudfoodOrderLine.DeleteAll();
        end;
        Message(Text1);
    end;

    var
        GudfoodOrderLine: Record "Gudfood Order Line";
        PostedGudfoodOrderLine: Record "Posted Gudfood Order Line";
        PostedGudfoodOrderHeader: Record "Posted Gudfood Order Header";

        Text1: Label 'The order successfully posted!';
}
