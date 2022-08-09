/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom13.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "wedding_party_orders")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "WeddingPartyOrders.findAll", query = "SELECT w FROM WeddingPartyOrders w"),
    @NamedQuery(name = "WeddingPartyOrders.findById", query = "SELECT w FROM WeddingPartyOrders w WHERE w.id = :id"),
    @NamedQuery(name = "WeddingPartyOrders.findByOrderDate", query = "SELECT w FROM WeddingPartyOrders w WHERE w.orderDate = :orderDate"),
    @NamedQuery(name = "WeddingPartyOrders.findByAmount", query = "SELECT w FROM WeddingPartyOrders w WHERE w.amount = :amount"),
    @NamedQuery(name = "WeddingPartyOrders.findByNote", query = "SELECT w FROM WeddingPartyOrders w WHERE w.note = :note"),
    @NamedQuery(name = "WeddingPartyOrders.findByPaymentStatus", query = "SELECT w FROM WeddingPartyOrders w WHERE w.paymentStatus = :paymentStatus"),
    @NamedQuery(name = "WeddingPartyOrders.findByQuantityTable", query = "SELECT w FROM WeddingPartyOrders w WHERE w.quantityTable = :quantityTable")})
public class WeddingPartyOrders implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_date")
    @Temporal(TemporalType.DATE)
    private Date orderDate;
    @Basic(optional = false)
    @NotNull
    @Column(name = "amount")
    private int amount;
    @Size(max = 45)
    @Column(name = "note")
    private String note;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 45)
    @Column(name = "payment_status")
    private String paymentStatus;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity_table")
    private int quantityTable;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "wpoId")
    private Set<ServicesDetail> servicesDetailSet;
    @JoinColumn(name = "menu_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Menu menuId;
    @JoinColumn(name = "pwt_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private PriceWeddingTime pwtId;
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private User userId;
    @JoinColumn(name = "wh_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private WeddingHall whId;

    public WeddingPartyOrders() {
    }

    public WeddingPartyOrders(Integer id) {
        this.id = id;
    }

    public WeddingPartyOrders(Integer id, Date orderDate, int amount, String paymentStatus, int quantityTable) {
        this.id = id;
        this.orderDate = orderDate;
        this.amount = amount;
        this.paymentStatus = paymentStatus;
        this.quantityTable = quantityTable;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getQuantityTable() {
        return quantityTable;
    }

    public void setQuantityTable(int quantityTable) {
        this.quantityTable = quantityTable;
    }

    @XmlTransient
    public Set<ServicesDetail> getServicesDetailSet() {
        return servicesDetailSet;
    }

    public void setServicesDetailSet(Set<ServicesDetail> servicesDetailSet) {
        this.servicesDetailSet = servicesDetailSet;
    }

    public Menu getMenuId() {
        return menuId;
    }

    public void setMenuId(Menu menuId) {
        this.menuId = menuId;
    }

    public PriceWeddingTime getPwtId() {
        return pwtId;
    }

    public void setPwtId(PriceWeddingTime pwtId) {
        this.pwtId = pwtId;
    }

    public User getUserId() {
        return userId;
    }

    public void setUserId(User userId) {
        this.userId = userId;
    }

    public WeddingHall getWhId() {
        return whId;
    }

    public void setWhId(WeddingHall whId) {
        this.whId = whId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WeddingPartyOrders)) {
            return false;
        }
        WeddingPartyOrders other = (WeddingPartyOrders) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom13.pojo.WeddingPartyOrders[ id=" + id + " ]";
    }
    
}
