// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 InteractionLog extends "Interaction Log Entries"
{
    layout
    {



        addafter("Date")
        {
            field("CallInitationTime"; Rec."Time of Interaction")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call Initation Time';
                Visible = Not isWelcomeCompany;


            }
            field("CallEndTime"; Rec.CallEndTime)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call End Time';
                Visible = Not isWelcomeCompany;


            }
            // field("PatientPhone"; Rec.PatientPhone)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Patient Phone';

            // }


        }
        addafter(Description)
        {
            field("PatientName"; Rec.PatientName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Name';
                Visible = Not isWelcomeCompany;
            }
        }

        addafter("PatientName")

        {
            field("ContactNo"; Rec.PatientPhone)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Phone';
                Visible = Not isWelcomeCompany;

            }


        }
        addafter("Description")
        {
            field("PatientId"; Rec.PatientId)
            {

                ApplicationArea = Basic, Suite;
                Caption = 'Patient ID';
                // TableRelation = Customer.Name;
                Visible = Not isWelcomeCompany;

            }
        }

        addafter("Salesperson Code")
        {
            field("Comments"; Rec.Comments1)
            {
                Caption = 'Comments';
                ApplicationArea = Basic, Suite;

                Visible = Not isWelcomeCompany;

            }
        }
        modify("Salesperson Code")
        {

            Caption = 'Provider Code';
            Visible = Not isWelcomeCompany;
        }
        // modify("Contact Name")
        // {
        //     Caption = 'Patient Name';
        // }
        modify("Contact No.")
        {
            // Visible = not isWelcomeCompany;
            // Visible = false;
            // Caption = salespersoncodecaption;
            // Caption = salespersoncodecaption;
            Visible = isWelcomeCompany;
        }

        modify("Contact Name")
        {
            Visible = isWelcomeCompany;
        }
    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin


        salespersoncodecaption := 'A';
        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');
            salespersoncodecaption := 'B';
        end;
    end;

}


pageextension 50109 createinteraction extends "Create Interaction"
{
    layout
    {



        addbefore("Campaign Description")
        {

            field("PatientName"; Rec.PatientName)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Patient Name';
                Visible = Not isWelcomeCompany;

            }
            field("PatientPhone"; Rec."Contact Phone No.")

            {

                ApplicationArea = Basic, Suite;
                Caption = 'Patient Phone';
                Visible = Not isWelcomeCompany;
            }
            field("Provider Code"; Rec."Salesperson Code")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Provider Code';
                Visible = Not isWelcomeCompany;

            }
            field("CallInitationTime"; Rec."Time of Interaction")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call Initation Time';
                Visible = Not isWelcomeCompany;

            }


            // field("CallInitiationTime"; Rec."Time of Interaction")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Visible = true;

            // }
            // field("CorrespondenceType"; Rec."Correspondence Type")
            // {
            //     ApplicationArea = Basic, Suite;
            //     Visible = false;

            // field("CallEndTime"; Rec.CallEndTime)
            // {
            //     ApplicationArea = Basic, Suite;
            //     Caption = 'Call End Time';

            // }

            // }
        }


        addafter("CallInitationTime")
        {
            field("CallEndTime"; Rec."CallEndTime")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Call End Time';
                Visible = Not isWelcomeCompany;
            }
        }

        modify("Time of Interaction")
        {
            Visible = isWelcomeCompany;
        }
        modify("Cost (LCY)")
        {
            Visible = isWelcomeCompany;
        }
        modify("Duration (Min.)")
        {
            Visible = isWelcomeCompany;
        }
        modify("Correspondence Type")
        {

            Visible = isWelcomeCompany;
        }


        modify("Campaign Response")
        {

            Visible = isWelcomeCompany;
        }
        modify("Campaign Target")
        {

            Visible = isWelcomeCompany;
        }


        modify("Information Flow")
        {

            Visible = isWelcomeCompany;
        }
        modify("Initiated By")
        {

            Visible = isWelcomeCompany;
        }
        modify("Campaign Description")
        {

            Visible = isWelcomeCompany;
        }
        modify("Interaction Successful")
        {

            Visible = isWelcomeCompany;
        }
        modify("Opportunity Description")
        {


            Visible = isWelcomeCompany;
        }
        modify("Evaluation")
        {

            Visible = isWelcomeCompany;
        }

    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin



        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');

        end;
    end;
}

tableextension 50144 segmentList extends "Segment Line"
{
    fields
    {

        field(50021; CallEndTime;
        Time)
        {
            Caption = 'Call End Time';

        }


        field(50023; PatientID;
        Text[12])
        {
            Caption = 'Patient ID';
        }


        field(50024; PatientName;
        Text[12])
        {
            AutoFormatType = 1;
            CalcFormula = max(Customer.Name where(Name = field("Contact Name")));
            Caption = 'Patient Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
tableextension 50145 interactionlogs extends "Interaction Log Entry"
{


    fields
    {
        field(50020; CallInitationTime;
        Time)
        {
            Caption = 'Call Initation Time';

        }
        field(50021; CallEndTime;
        Time)
        {
            Caption = 'Call End Time';

        }
        field(50022; PatientPhone;
        Text[12])
        {
            Caption = 'Patient Phone';


        }

        field(50023; PatientID;
        Text[12])
        {
            Caption = 'Patient ID';

        }
        field(50024; PatientName;
        Text[12])
        {
            Caption = 'Patient Name';

        }

        field(50025; Comments;
        Text[12])
        {

            Caption = 'Comments';

        }
        field(50026; Comments1;
        text[80])
        {
            AutoFormatType = 1;
            CalcFormula = lookup("Inter. Log Entry Comment Line".Comment where("Entry No." = field("Entry No.")));
            FieldClass = FlowField;
            Caption = 'Comments';

        }


    }

}
tableextension 50146 CrmExt extends Contact
{
    fields
    {
        field(50100; "Patient ID"; code[2048])
        {

        }
        field(50101; "ICD 1"; code[2048])
        {

        }

        field(50102; "ICD 2"; code[2048])
        {

        }

        field(50103; "ICD 3"; code[2048])
        {

        }

        field(50104; "CPT 1"; code[2048])
        {

        }

        field(50105; "CPT 2"; code[2048])
        {

        }

        field(50106; "CPT 3"; code[2048])
        {

        }

        field(50107; "Insurance Carrier / Plan Name"; code[2048])
        {

        }

        field(50108; "PC Doctor"; code[2048])
        {

        }

        field(50109; "Patient First Name"; Text[2048])
        {

        }

        field(50110; "Patient Last Name"; Text[2048])
        {

        }

        field(50111; "Sex"; Text[2048])
        {

        }

        field(50112; "Marital Status"; Text[2048])
        {

        }

        field(50113; "Primary Language"; Text[2048])
        {

        }

        field(50114; "Race / Ethnicity"; Text[2048])
        {

        }

        field(50115; "Employer"; Text[2048])
        {

        }
        field(50116; "Emergency Contact Phone "; Text[2048])
        {

        }
        field(50117; "Reason For Last Visit"; Text[2048])
        {

        }
        field(50118; "Patient Balance"; Integer)
        {

        }
        field(50119; "Deductible"; Integer)
        {

        }
        field(50120; "Date of Birth"; Date)
        {

        }
        field(50121; "Last Visit Date"; Date)
        {

        }

    }
}

pageextension 50148 CrmExtContactList extends "Contact List"
{

    layout
    {
        modify("Salesperson Code")
        {
            Caption = 'Agent Code';


        }
        addafter("Territory Code")
        {

            field("Patient ID"; Rec."Patient ID")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("ICD 1"; Rec."ICD 1")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }

            field("ICD 2"; Rec."ICD 2")

            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("ICD 3"; Rec."ICD 3")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("CPT 1"; Rec."CPT 1")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("CPT 2"; Rec."CPT 2")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }

            field("CPT 3"; Rec."CPT 3")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Insurance Carrier / Plan Name"; Rec."Insurance Carrier / Plan Name")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("PC Doctor"; Rec."PC Doctor")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Patient First Name"; Rec."Patient First Name")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Patient Last Name"; Rec."Patient Last Name")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Sex"; Rec."Sex")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Marital Status"; Rec."Marital Status")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Primary Language"; Rec."Primary Language")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Race / Ethnicity"; Rec."Race / Ethnicity")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Employer"; Rec."Employer")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Emergency Contact Phone"; Rec."Emergency Contact Phone ")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Reason For Last Visit"; Rec."Reason For Last Visit")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }

            field("Patient Balance"; Rec."Patient Balance")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }

            field("Deductible"; Rec."Deductible")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Date of Birth"; Rec."Date of Birth")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }
            field("Last Visit Date"; Rec."Last Visit Date")
            {
                ApplicationArea = Basic, Suite;
                Visible = NOT iswelcomecompany;
            }


        }




    }
    actions
    {

        modify(Action63)
        {
            Visible = isWelcomeCompany;
        }
        modify(Action64)
        {
            Visible = isWelcomeCompany;
        }
        modify("&Picture")
        {
            Visible = isWelcomeCompany;
        }
        modify(Action65)
        {
            Visible = isWelcomeCompany;
        }
        modify("C&ontact")
        {
            Visible = isWelcomeCompany;
        }
        modify("Business Relations")
        {
            Visible = isWelcomeCompany;
        }
        modify(Card)
        {
            Visible = isWelcomeCompany;
        }
        modify(Documents)
        {
            Visible = isWelcomeCompany;
        }
        modify(DiscountLines)
        {
            Visible = isWelcomeCompany;
        }

        modify(ActionGroupCRM)
        {
            Visible = isWelcomeCompany;

        }
        modify("Alternati&ve Address")
        {
            Visible = isWelcomeCompany;

        }
        modify("Closed Oppo&rtunities")
        {
            Visible = isWelcomeCompany;

        }
        modify("Create Opportunity")
        {
            Visible = isWelcomeCompany;

        }
        modify(CreateEmployee)
        {
            Visible = isWelcomeCompany;

        }


        modify(CreateFromCRM)
        {
            Visible = isWelcomeCompany;

        }


        modify(CreateInCRM)
        {
            Visible = isWelcomeCompany;

        }

        modify(Customer)
        {
            Visible = isWelcomeCompany;

        }

        modify("Contact Labels")
        {
            Visible = isWelcomeCompany;

        }

        modify(Create)
        {
            Visible = isWelcomeCompany;

        }
        modify(SyncWithExchange)
        {
            Visible = isWelcomeCompany;

        }
        modify("Sales Cycle Analysis")
        {
            Visible = isWelcomeCompany;

        }
        modify("Comp&any")
        {
            Visible = isWelcomeCompany;

        }
        modify(Coupling)
        {
            Visible = isWelcomeCompany;

        }
        modify(CRMGotoContact)
        {
            Visible = isWelcomeCompany;

        }
        modify(CRMSynchronizeNow)
        {
            Visible = isWelcomeCompany;

        }
        modify("Date Ranges")
        {
            Visible = isWelcomeCompany;

        }
        modify(Email)
        {
            Visible = isWelcomeCompany;

        }
        modify("Export Contact")
        {
            Visible = isWelcomeCompany;

        }
        modify("Create as")
        {
            Visible = isWelcomeCompany;

        }
        modify("F&unctions")
        {
            Visible = isWelcomeCompany;

        }
        modify("Industry Groups")
        {
            Visible = isWelcomeCompany;

        }
        modify("Interaction Log E&ntries")
        {
            Visible = isWelcomeCompany;

        }
        modify("Job Responsibilities")
        {
            Visible = isWelcomeCompany;

        }
        modify(WordTemplate)
        {
            Visible = isWelcomeCompany;

        }
        modify("Web Sources")
        {
            Visible = isWelcomeCompany;

        }
        modify("Open Oppo&rtunities")
        {
            Visible = isWelcomeCompany;
        }

        modify(Statistics)
        {
            Visible = isWelcomeCompany;
        }

        modify(Vendor)
        {
            Visible = isWelcomeCompany;
        }
        modify(Bank)
        {
            Visible = isWelcomeCompany;
        }
        modify(RelatedBank)
        {
            Visible = isWelcomeCompany;
        }
        modify(RelatedCustomer)
        {
            Visible = isWelcomeCompany;
        }
        modify(RelatedEmployee)
        {
            Visible = isWelcomeCompany;
        }
        modify(RelatedVendor)
        {
            Visible = isWelcomeCompany;
        }

        modify(NewSalesQuote)
        {
            Visible = isWelcomeCompany;
        }

        modify(ShowSalesQuotes)
        {
            Visible = isWelcomeCompany;
        }
        modify("Postponed &Interactions")
        {
            Visible = isWelcomeCompany;
        }
        modify("P&erson")
        {
            Visible = isWelcomeCompany;
        }
        modify("Pro&files")
        {
            Visible = isWelcomeCompany;
        }
        modify(MakePhoneCall)
        {
            Visible = isWelcomeCompany;
        }
        modify("Relate&d Contacts")
        {
            Visible = isWelcomeCompany;
        }
        modify("Related Information")
        {
            Visible = isWelcomeCompany;
        }








        modify("Create &Interaction")
        {
            Visible = NOT isWelcomeCompany;

            ApplicationArea = RelationshipMgmt;
            Caption = 'Create &Interaction';

            Promoted = true;
            PromotedCategory = Process;
            ToolTip = 'Create an interaction with a specified contact.';




        }




    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin

        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');

        end;
    end;
}

pageextension 50149 CustomContactCard extends "Contact Card"
{
    layout
    {
        modify("Salesperson Code")
        {
            Caption = 'Agent Code';


        }

        addafter("Profile Questionnaire")
        {
            group(PateintDetails)
            {
                Caption = 'Patient Details';
                field("Patient ID"; Rec."Patient ID")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("ICD 1"; Rec."ICD 1")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }

                field("ICD 2"; Rec."ICD 2")

                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("ICD 3"; Rec."ICD 3")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("CPT 1"; Rec."CPT 1")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("CPT 2"; Rec."CPT 2")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }

                field("CPT 3"; Rec."CPT 3")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Insurance Carrier / Plan Name"; Rec."Insurance Carrier / Plan Name")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("PC Doctor"; Rec."PC Doctor")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Patient First Name"; Rec."Patient First Name")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Patient Last Name"; Rec."Patient Last Name")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Sex"; Rec."Sex")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Primary Language"; Rec."Primary Language")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Race / Ethnicity"; Rec."Race / Ethnicity")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Employer"; Rec."Employer")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Emergency Contact Phone"; Rec."Emergency Contact Phone ")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Reason For Last Visit"; Rec."Reason For Last Visit")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }

                field("Patient Balance"; Rec."Patient Balance")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }

                field("Deductible"; Rec."Deductible")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }
                field("Last Visit Date"; Rec."Last Visit Date")
                {
                    ApplicationArea = Basic, Suite;
                    Visible = NOT iswelcomecompany;
                }


            }
        }
    }
    var
        salespersoncodecaption: Text[1000];

        isWelcomeCompany: Boolean;

    trigger OnOpenPage();
    begin

        isWelcomeCompany := true;

        if CompanyName() = 'Welcome Center'

        then begin
            isWelcomeCompany := false;
            // Caption := Caption('Patients');

        end;
    end;
}







