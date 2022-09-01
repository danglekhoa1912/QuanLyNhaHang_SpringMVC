/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.nhom13.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Set;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "price_wedding_time")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PriceWeddingTime.findAll", query = "SELECT p FROM PriceWeddingTime p"),
    @NamedQuery(name = "PriceWeddingTime.findById", query = "SELECT p FROM PriceWeddingTime p WHERE p.id = :id"),
    @NamedQuery(name = "PriceWeddingTime.findByPrice", query = "SELECT p FROM PriceWeddingTime p WHERE p.price = :price"),
    @NamedQuery(name = "PriceWeddingTime.findBySession", query = "SELECT p FROM PriceWeddingTime p WHERE p.session = :session")})
public class PriceWeddingTime implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "price")
    private double price;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 25)
    @Column(name = "session")
    private String session;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "pwtId")
    private Set<WeddingPartyOrders> weddingPartyOrdersSet;

    public PriceWeddingTime() {
    }

    public PriceWeddingTime(Integer id) {
        this.id = id;
    }

    public PriceWeddingTime(Integer id, double price, String session) {
        this.id = id;
        this.price = price;
        this.session = session;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    @XmlTransient
    public Set<WeddingPartyOrders> getWeddingPartyOrdersSet() {
        return weddingPartyOrdersSet;
    }

    public void setWeddingPartyOrdersSet(Set<WeddingPartyOrders> weddingPartyOrdersSet) {
        this.weddingPartyOrdersSet = weddingPartyOrdersSet;
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
        if (!(object instanceof PriceWeddingTime)) {
            return false;
        }
        PriceWeddingTime other = (PriceWeddingTime) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.nhom13.pojo.PriceWeddingTime[ id=" + id + " ]";
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getSession() {
        return session;
    }

    public void setSession(String session) {
        this.session = session;
    }
    
}
