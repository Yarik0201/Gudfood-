namespace ALProject.ALProject;

report 50100 "Gudfood Order"
{
    ApplicationArea = All;
    Caption = 'Gudfood Order';
    UsageCategory = None;
    DefaultRenderingLayout = GudffodWORDLayout;
    dataset
    {
        dataitem(GudfoodOrderHeader; "Gudfood Order Header")
        {
            DataItemTableView = sorting("No.");
            column(Date_Created; "Date Created")
            {
                IncludeCaption = true;
            }
            column(Sell__to_Customer_No_; "Sell- to Customer No.")
            {
                IncludeCaption = true;
            }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            {
                IncludeCaption = true;
            }
            column(Total_Amount; "Total Amount")
            {
                IncludeCaption = true;
            }


            dataitem(GudfoodOrderLine; "Gudfood Order Line")
            {
                DataItemLinkReference = GudfoodOrderHeader;
                DataItemLink = "Order No." = field("No.");
                DataItemTableView = sorting("Order No.");

                column(Item_No_; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Item_Type; "Item Type")
                {
                    IncludeCaption = true;
                }
                column(Description; "Description")
                {
                    IncludeCaption = true;
                }
                column(Quantity; "Quantity")
                {
                    IncludeCaption = true;
                }
                column(Unit_Price; "Unit Price")
                {
                    IncludeCaption = true;
                }
                column(Amount; "Amount")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout(GudffodWORDLayout)
        {
            type = Word;
            LayoutFile = 'layout/GudfoodWORDLayout.docx';
            Caption = 'GudfoodOrder Report';

        }
        layout(GudffodRDLCLayout)
        {
            type = RDLC;
            LayoutFile = 'layout/GudfoodRDLC1Layout.rdl';
            Caption = 'GudfoodOrder Report';

        }
    }
}
