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
    
    public partial class events
    {
        public events()
        {
            this.event_seating = new HashSet<event_seating>();
            this.group_requests = new HashSet<group_requests>();
        }
    
        public int event_id { get; set; }
        public int location_id { get; set; }
        public int event_type_id { get; set; }
        public int season_id { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public System.DateTime date_start { get; set; }
        public System.DateTime date_end { get; set; }
        public decimal regular_price { get; set; }
        public decimal prime_price { get; set; }
    
        public virtual event_types event_type { get; set; }
        public virtual locations location { get; set; }
        public virtual seasons season { get; set; }
        public virtual ICollection<event_seating> event_seating { get; set; }
        public virtual ICollection<group_requests> group_requests { get; set; }
    }
}