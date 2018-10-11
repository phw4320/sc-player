package com.sc.player.vo;

import org.apache.ibatis.type.Alias;

@Alias("sc")
public class PlayerInfo {
	private String scname;
	private String sctimname;
	private Integer scbacknum;
	private String scposition;
	private String sccountry;
	private Integer scheight;
	private Integer scweight;
	private String scbirthdat;
	private String scbloodtype;
	private String scpropic;
	private String scdesc;
	private Integer scnum;
	public PlayerInfo() {}
	
	public PlayerInfo(String scname, String sctimname, Integer scbacknum, String scposition, String sccountry,
			Integer scheight, Integer scweight, String scbirthdat, String scbloodtype, String scpropic, String scdesc,
			Integer scnum) {
		super();
		this.scname = scname;
		this.sctimname = sctimname;
		this.scbacknum = scbacknum;
		this.scposition = scposition;
		this.sccountry = sccountry;
		this.scheight = scheight;
		this.scweight = scweight;
		this.scbirthdat = scbirthdat;
		this.scbloodtype = scbloodtype;
		this.scpropic = scpropic;
		this.scdesc = scdesc;
		this.scnum = scnum;
	}
	@Override
	public String toString() {
		return "PlayerInfo [scname=" + scname + ", sctimname=" + sctimname + ", scbacknum=" + scbacknum
				+ ", scposition=" + scposition + ", sccountry=" + sccountry + ", scheight=" + scheight + ", scweight="
				+ scweight + ", scbirthdat=" + scbirthdat + ", scbloodtype=" + scbloodtype + ", scpropic=" + scpropic
				+ ", scdesc=" + scdesc + ", scnum=" + scnum + "]";
	}
	public Integer getScnum() {
		return scnum;
	}
	public void setScnum(Integer scnum) {
		this.scnum = scnum;
	}
	public String getScname() {
		return scname;
	}
	public void setScname(String scname) {
		this.scname = scname;
	}
	public String getSctimname() {
		return sctimname;
	}
	public void setSctimname(String sctimname) {
		this.sctimname = sctimname;
	}
	public Integer getScbacknum() {
		return scbacknum;
	}
	public void setScbacknum(Integer scbacknum) {
		this.scbacknum = scbacknum;
	}
	public String getScposition() {
		return scposition;
	}
	public void setScposition(String scposition) {
		this.scposition = scposition;
	}
	public String getSccountry() {
		return sccountry;
	}
	public void setSccountry(String sccountry) {
		this.sccountry = sccountry;
	}
	public Integer getScheight() {
		return scheight;
	}
	public void setScheight(Integer scheight) {
		this.scheight = scheight;
	}
	public Integer getScweight() {
		return scweight;
	}
	public void setScweight(Integer scweight) {
		this.scweight = scweight;
	}
	public String getScbirthdat() {
		return scbirthdat;
	}
	public void setScbirthdat(String scbirthdat) {
		this.scbirthdat = scbirthdat;
	}
	public String getScbloodtype() {
		return scbloodtype;
	}
	public void setScbloodtype(String scbloodtype) {
		this.scbloodtype = scbloodtype;
	}
	public String getScpropic() {
		return scpropic;
	}
	public void setScpropic(String scpropic) {
		this.scpropic = scpropic;
	}
	public String getScdesc() {
		return scdesc;
	}
	public void setScdesc(String scdesc) {
		this.scdesc = scdesc;
	}


}
