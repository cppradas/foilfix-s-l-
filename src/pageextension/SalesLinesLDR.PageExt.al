pageextension 50105 "Sales Order Subform_LDR" extends "Sales Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field("Reference per pallet_LDR"; Rec."Reference per pallet_LDR")
            {
                ApplicationArea = All;
            }
            field("Observations Expedition_LDR"; Rec."Observations Expedition_LDR")
            {
                ApplicationArea = All;
            }
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