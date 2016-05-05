<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="VersityFinalProject.page.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="headerContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
<div class="container" style="border:1px solid #3b3535; background:#c4d1bd; border-radius:3px;">
 <div class="row" style="color:#000000; ">
     <h2 style="font-size:30px; margin-left:2%">Contact us:</h2>
     <hr />
     <div class="col-md-12" style="height:150px;">
        <div class="col-md-3"  style="background:#ffffff; border:1px solid #000000; border-radius:2px;>
           <p class="contact_p" margin-left;2px;">
               <b>+Shoikoth ahammed.</b><br />
               <b>Email:shoikothahammed@gmail.com</b></br>
               <b>Cell:+8801515213800.</b></br>
               Dhanmondi, Dhaka, Bangladesh.
           </p>
        </div>
         <div class="col-md-3"  style="background:#ffffff; border:1px solid #000000; border-radius:2px;>
           <p class="contact_p" margin-left;2px;">
               <b>+Emrul kayes.</b><br />
               <b>Email:emrulkayes@gmail.com</b></br>
               <b>Cell:+88016878408008.</b></br>
               Sobahanbag, Dhaka, Bangladesh.
           </p>
        </div>
        <div class="col-md-3"  style="background:#ffffff; border:1px solid #000000; border-radius:2px;>
           <p class="contact_p" margin-left;2px;">
               <b>+MD.Mirazul Islam</b><br />
               <b>Email:md_miraz@gmail.com</b></br>
               <b>Cell:+8801745866833.</b></br>
               Savar, Dhaka, Bangladesh.
           </p>
        </div>
        <div class="col-md-3"  style="background:#ffffff; border:1px solid #000000; border-radius:2px;>
           <p class="contact_p" margin-left;2px;">
               <b>+Suvo THE Darkstory.</b><br />
               <b>Email:suvo_darkstory@gmail.com</b></br>
               <b>Cell:+8801923456789.</b></br>
               Farmgate, Dhaka, Bangladesh.
           </p>
        </div>
      </div>
  </div>
    <div class="row" style="color:#000000; ">
     <h2 style="font-size:30px; margin-left:2%">Contact us form:</h2>
     <hr />
         <div class="col-md-12" style="height:150px;">
             <div class="col-md-4">
                 <label>Name:</label>
                 <input type="text" class="form-control" placeholder="--Give name here--">
             </div>
             <div class="col-md-4">
               <label>Area:</label>
                 <input type="text" class="form-control" placeholder="--your area--">
             </div>
             <div class="col-md-4">
               <label>Massage:</label>
               <textarea class="form-control" rows="3" placeholder="Write your massage..."></textarea>
             </div>
         </div>
      </div>
     <div class="row" style="color:#000000; ">
        <div class="col-md-12" style="margin-bottom:20px;">
            <div class="col-md-4"></div>
            <div class="col-md-4">
             <button type="button" style="background:#1bb02e; margin-left:60px;" class="btn btn-primary btn-lg">Submit Massage</button>
            </div>
            <div class="col-md-4"></div>
        </div>
      </div>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
</asp:Content>