namespace ALProject.ALProject;

xmlport 50100 "Export Gudfood Order"
{
    Caption = 'Export Gudfood Order';
    Direction = Export;
    Format = Xml;

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(GudfoodOrderHeader; "Gudfood Order Header")
            {
                RequestFilterFields = "No.";
                fieldelement(No; GudfoodOrderHeader."No.")
                {
                }
                fieldelement(SelltoCustomerNo; GudfoodOrderHeader."Sell- to Customer No.")
                {
                }
                fieldelement(SelltoCustomerName; GudfoodOrderHeader."Sell-to Customer Name")
                {
                }
                fieldelement(OrderDate; GudfoodOrderHeader."Order Date")
                {
                }
                fieldelement(PostingNo; GudfoodOrderHeader."Posting No.")
                {
                }
                fieldelement(DateCreated; GudfoodOrderHeader."Date Created")
                {
                }
                fieldelement(TotalQty; GudfoodOrderHeader."Total Qty")
                {
                }
                fieldelement(TotalAmount; GudfoodOrderHeader."Total Amount")
                {
                }
                tableelement(GudfoodOrderLine; "Gudfood Order Line")
                {
                    LinkTable = GudfoodOrderHeader;
                    LinkFields = "Order No." = field("No.");

                    fieldelement(OrderNo; GudfoodOrderLine."Order No.")
                    {
                    }
                    fieldelement(LineNo; GudfoodOrderLine."Line No.")
                    {
                    }
                    fieldelement(SelltoCustomerNo; GudfoodOrderLine."Sell- to Customer No.")
                    {
                    }
                    fieldelement(DateCreated; GudfoodOrderLine."Date Created")
                    {
                    }
                    fieldelement(ItemNo; GudfoodOrderLine."Item No.")
                    {
                    }
                    fieldelement(ItemType; GudfoodOrderLine."Item Type")
                    {
                    }
                    fieldelement(Description; GudfoodOrderLine.Description)
                    {
                    }
                    fieldelement(Quantity; GudfoodOrderLine.Quantity)
                    {
                    }
                    fieldelement(UnitPrice; GudfoodOrderLine."Unit Price")
                    {
                    }
                    fieldelement(Amount; GudfoodOrderLine.Amount)
                    {
                    }
                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
