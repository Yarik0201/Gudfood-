namespace ALProject.ALProject;

page 50103 "Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order';
    PageType = Document;
    SourceTable = "Gudfood Order Header";
    UsageCategory = None;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Sell- to Customer No."; Rec."Sell- to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Sell- to Customer No. field.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the value of the Sell-to Customer Name field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("Posting No."; Rec."Posting No.")
                {
                    ToolTip = 'Specifies the value of the Posting No. field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ToolTip = 'Specifies the value of the Total Qty field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
            part(GudfoodOrderSubpage; "Gudfood Order Subpage")
            {
                Caption = 'Gudfood Order Subpage';
                SubPageLink = "Order No." = field("No.");
            }

        }
    }
    actions
    {
        area(Navigation)
        {
            group(Home)
            {
                Caption = 'Posting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = All;
                    Caption = 'Post';
                    Image = PostOrder;
                    ToolTip = 'Post current document';

                    trigger OnAction()
                    begin
                        CopyFunction.CopyToPosted(Rec);
                    end;
                }
                action(Print)
                {
                    ApplicationArea = All;
                    Caption = 'Print';
                    Image = Print;
                    ToolTip = 'Print document';
                    trigger OnAction()

                    begin
                        Rec.SetRecFilter();
                        Report.RunModal(Report::"Gudfood Order", true, true, Rec);
                    end;
                }
                action("Export Order")
                {
                    ApplicationArea = All;
                    Caption = 'Export Order';
                    Image = Export;
                    ToolTip = 'Export document';
                    RunObject = xmlport "Export Gudfood Order";

                }
            }
        }
        area(Promoted)
        {
            actionref("P&ost"; Post)
            {
            }
            actionref("Pr&int"; Print)
            {
            }
            actionref(ExportOrder; "Export Order")
            {
            }

        }

    }
    var
        CopyFunction: Codeunit "Copy Function";
}
