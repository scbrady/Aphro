//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Aphro.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class group_requests
    {
        public int event_id { get; set; }
        public int requester_id { get; set; }
        public int requested_id { get; set; }
        public bool has_accepted { get; set; }
    
        public virtual people requested { get; set; }
        public virtual events @event { get; set; }
        public virtual people requester { get; set; }
    }
}