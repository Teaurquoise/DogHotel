//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace HotelZaPse.Models.EFRepository
{
    using System;
    using System.Collections.Generic;
    
    public partial class AdminModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public AdminModel()
        {
            this.Uslugas = new HashSet<UslugaModel>();
        }
    
        public int adminID { get; set; }
        public string ime { get; set; }
        public string prezime { get; set; }
        public string mail { get; set; }
        public string lozinka { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UslugaModel> Uslugas { get; set; }
    }
}
