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
    
    public partial class PasModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PasModel()
        {
            this.Rezervacijas = new HashSet<RezervacijaModel>();
        }
    
        public int pasID { get; set; }
        public int vlasnikID { get; set; }
        public string imePsa { get; set; }
        public string rasa { get; set; }
        public bool pol { get; set; }
        public bool sterilisan { get; set; }
        public string opis { get; set; }
        public bool obrisan { get; set; }
    
        public virtual VlasnikModel Vlasnik { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RezervacijaModel> Rezervacijas { get; set; }
    }
}
