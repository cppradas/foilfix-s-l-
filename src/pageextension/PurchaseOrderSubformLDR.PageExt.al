pageextension 50110 "Purchase Order Subform_LDR" extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Send to SGA_LDR"; Rec."Send to SGA_LDR")
            {
                ApplicationArea = All;
            }
            field("Shipment Date_LDR"; Rec."Shipment Date_LDR")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Shipment time_LDR"; Rec."Shipment time_LDR")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}