<?xml version="1.0" encoding="UTF-8"?>
<!--
  ~ Copyright (c) 2014. Boston University
  ~
  ~ Licensed under the Educational Community License, Version 2.0 (the "License"); you may not use this
  ~ file except in compliance with the License. You may obtain a copy of the License at
  ~
  ~ http://www.opensource.org/licenses/ecl1.php
  ~
  ~ Unless required by applicable law or agreed to in writing, software distributed under the License is
  ~ distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND either express or
  ~ implied.
  ~
  ~ See the License for the specific language governing permissions and limitations under the License.
  -->

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:n1="http://printing.award.kc.kuali.bu.edu/awardnotice" xmlns:xdt="http://www.w3.org/2005/xpath-datatypes" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:output version="1.0" method="xml" encoding="UTF-8" indent="no"/>
    <xsl:variable name="XML1" select="/"/>
    <xsl:variable name="fo:layout-master-set">
        <fo:layout-master-set>
            <fo:simple-page-master master-name="even-page-master" margin-left="0.6in" margin-right="0.6in" page-height="11in" page-width="8.5in">
                <fo:region-body margin-top="100" margin-bottom="0.79in"/>
                <fo:region-before region-name="even-page-header" extent="100"/>
                <fo:region-after extent="0.79in"/>
            </fo:simple-page-master>
            <fo:simple-page-master master-name="odd-page-master" margin-left="0.6in" margin-right="0.6in" page-height="11in" page-width="8.5in">
                <fo:region-body margin-top="100" margin-bottom="0.79in"/>
                <fo:region-before region-name="odd-page-header" extent="100"/>
                <fo:region-after extent="0.79in"/>
            </fo:simple-page-master>
            <fo:page-sequence-master master-name="default-page">
                <fo:repeatable-page-master-alternatives>
                    <fo:conditional-page-master-reference master-reference="odd-page-master" odd-or-even="odd"/>
                    <fo:conditional-page-master-reference master-reference="even-page-master" odd-or-even="even"/>
                </fo:repeatable-page-master-alternatives>
            </fo:page-sequence-master>
        </fo:layout-master-set>
    </xsl:variable>
    <xsl:template match="/">
        <xsl:variable name="maxwidth" select="7.30000"/>
        <fo:root>
            <xsl:copy-of select="$fo:layout-master-set"/>
            <fo:page-sequence master-reference="default-page" initial-page-number="1" format="1">
                <xsl:call-template name="headerodd"/>
                <xsl:call-template name="headereven"/>
                <xsl:call-template name="footerall"/>
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="8pt">
                        <xsl:for-each select="$XML1">
                            <xsl:for-each select="n1:AwardNotice">
                                <xsl:for-each select="n1:AwardHeader">
                                    <xsl:variable name="tablewidth0" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                    <xsl:variable name="sumcolumnwidths0" select="$tablewidth0 * 0.33000 + $tablewidth0 * 0.34000"/>
                                    <xsl:variable name="factor0">
                                        <xsl:choose>
                                            <xsl:when test="$sumcolumnwidths0 &gt; 0.00000 and $sumcolumnwidths0 &gt; $tablewidth0">
                                                <xsl:value-of select="$tablewidth0 div $sumcolumnwidths0"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="1.000"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="defaultcolumns0" select="1"/>
                                    <xsl:variable name="defaultcolumnwidth0">
                                        <xsl:choose>
                                            <xsl:when test="$factor0 &lt; 1.000">
                                                <xsl:value-of select="0.000"/>
                                            </xsl:when>
                                            <xsl:when test="$defaultcolumns0 &gt; 0">
                                                <xsl:value-of select="($tablewidth0 - $sumcolumnwidths0) div $defaultcolumns0"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="0.000"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:variable>
                                    <xsl:variable name="columnwidth0_0" select="$defaultcolumnwidth0"/>
                                    <xsl:variable name="columnwidth0_1" select="$tablewidth0 * 0.33000 * $factor0"/>
                                    <xsl:variable name="columnwidth0_2" select="$tablewidth0 * 0.34000 * $factor0"/>
                                    <fo:table width="{$maxwidth}in">
                                        <fo:table-column column-width="{0.01042}in"/>
                                        <fo:table-column column-width="{$tablewidth0}in"/>
                                        <fo:table-column column-width="{0.01042}in"/>
                                        <fo:table-body>
                                            <fo:table-row>
                                                <fo:table-cell>
                                                    <fo:block/>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block>
                                                        <fo:table width="{$tablewidth0}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                            <fo:table-column column-width="{$columnwidth0_0}in"/>
                                                            <fo:table-column column-width="{$columnwidth0_1}in"/>
                                                            <fo:table-column column-width="{$columnwidth0_2}in"/>
                                                            <fo:table-body font-size="8pt">
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Date:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:TransactionDate">
                                                                                <xsl:if test=". !=&apos;&apos;">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 6, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 9, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(string(.)), 1, 4)), '0000')"/>
                                                                                    </fo:inline>
                                                                                </xsl:if>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Transaction Type:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:TransactionType">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_1 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>SAP Grant Number: </xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:SAPGrantNumber">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_2 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Funds Center: </xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:FundsCenterInfo">
                                                                                <xsl:for-each select="n1:Address1">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:apply-templates>
                                                                                            <xsl:with-param name="maxwidth" select="$columnwidth0_0 - 0.01042 - 0.01042"/>
                                                                                        </xsl:apply-templates>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                                <fo:block font-size="8pt">
                                                                                    <fo:leader leader-pattern="space"/>
                                                                                </fo:block>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" number-columns-spanned="2" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Investigator(s): </xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:variable name="tablewidth1" select="$columnwidth0_1 * 1.00000 + $columnwidth0_2 * 1.00000 - 0.01042 - 0.01042"/>
                                                                            <xsl:variable name="sumcolumnwidths1" select="0.000"/>
                                                                            <xsl:variable name="defaultcolumns1" select="1 + 1"/>
                                                                            <xsl:variable name="defaultcolumnwidth1">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="$defaultcolumns1 &gt; 0">
                                                                                        <xsl:value-of select="($tablewidth1 - $sumcolumnwidths1) div $defaultcolumns1"/>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <xsl:value-of select="0.000"/>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:variable>
                                                                            <xsl:variable name="columnwidth1_0" select="$defaultcolumnwidth1"/>
                                                                            <xsl:variable name="columnwidth1_1" select="$defaultcolumnwidth1"/>
                                                                            <fo:table width="{$tablewidth1}in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                                <fo:table-column column-width="{$columnwidth1_0}in"/>
                                                                                <fo:table-column column-width="{$columnwidth1_1}in"/>
                                                                                <fo:table-body font-size="8pt">
                                                                                    <xsl:for-each select="n1:Investigators">
                                                                                        <xsl:for-each select="n1:Investigator">
                                                                                            <fo:table-row font-size="8pt">
                                                                                                <fo:table-cell font-size="8pt" number-columns-spanned="2">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:PersonName">
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth1_0 + $columnwidth1_1"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                        <fo:inline font-size="8pt">
                                                                                                            <xsl:text> (</xsl:text>
                                                                                                        </fo:inline>
                                                                                                        <xsl:for-each select="n1:Role">
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth1_0 + $columnwidth1_1"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                        <fo:inline font-size="8pt">
                                                                                                            <xsl:text>)</xsl:text>
                                                                                                        </fo:inline>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                            </fo:table-row>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" number-columns-spanned="3" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Title:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:Title">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_0 + $columnwidth0_1 + $columnwidth0_2 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Sponsor:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:SponsorDescription">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_0 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Prime Sponsor:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:PrimeSponsorDescription">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_1 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Sponsor Award ID:</xsl:text>
                                                                            </fo:inline>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>&#160;</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:for-each select="n1:SponsorAwardNumber">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:apply-templates>
                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth0_2 - 0.01042 - 0.01042"/>
                                                                                    </xsl:apply-templates>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>Dept. Admin:</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:variable name="tablewidth2" select="$columnwidth0_0 * 1.00000 - 0.01042 - 0.01042"/>
                                                                            <xsl:variable name="sumcolumnwidths2" select="$tablewidth2 * 0.30000 + $tablewidth2 * 0.25000 + $tablewidth2 * 0.45000"/>
                                                                            <xsl:variable name="factor2">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="$sumcolumnwidths2 &gt; 0.00000 and $sumcolumnwidths2 &gt; $tablewidth2">
                                                                                        <xsl:value-of select="$tablewidth2 div $sumcolumnwidths2"/>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <xsl:value-of select="1.000"/>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:variable>
                                                                            <xsl:variable name="columnwidth2_0" select="$tablewidth2 * 0.30000 * $factor2"/>
                                                                            <xsl:variable name="columnwidth2_1" select="$tablewidth2 * 0.25000 * $factor2"/>
                                                                            <xsl:variable name="columnwidth2_2" select="$tablewidth2 * 0.45000 * $factor2"/>
                                                                            <fo:table width="{$tablewidth2}in" border-collapse="separate" font-size="6pt" color="black" display-align="center">
                                                                                <fo:table-column column-width="{$columnwidth2_0}in"/>
                                                                                <fo:table-column column-width="{$columnwidth2_1}in"/>
                                                                                <fo:table-column column-width="{$columnwidth2_2}in"/>
                                                                                <fo:table-body font-size="6pt">
                                                                                    <xsl:for-each select="n1:DepartmentAdminList">
                                                                                        <xsl:for-each select="n1:Admin">
                                                                                            <fo:table-row font-size="8pt">
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Name">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth2_0"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text> </xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Phone">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth2_1"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text></xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Email">
                                                                                                            <fo:basic-link font-size="6pt" text-decoration="underline" color="blue">
                                                                                                                <xsl:choose>
                                                                                                                    <xsl:when test="substring(string(concat('mailto:',.)), 1, 1) = '#'">
                                                                                                                        <xsl:attribute name="internal-destination">
                                                                                                                            <xsl:value-of select="substring(string(concat('mailto:',.)), 2)"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:when>
                                                                                                                    <xsl:otherwise>
                                                                                                                        <xsl:attribute name="external-destination">
                                                                                                                            <xsl:if test="substring(string(concat('mailto:',.)), 2, 1) = ':'">
                                                                                                                                <xsl:text>file:///</xsl:text>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:value-of select="translate(string(concat('mailto:',.)), '&#x5c;', '/')"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:otherwise>
                                                                                                                </xsl:choose>
                                                                                                                <fo:inline font-size="6pt">
                                                                                                                    <xsl:apply-templates/>
                                                                                                                </fo:inline>
                                                                                                            </fo:basic-link>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                            </fo:table-row>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>OSP Admin:</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:variable name="tablewidth3" select="$columnwidth0_1 * 1.00000 - 0.01042 - 0.01042"/>
                                                                            <xsl:variable name="sumcolumnwidths3" select="$tablewidth3 * 0.30000 + $tablewidth3 * 0.25000 + $tablewidth3 * 0.45000"/>
                                                                            <xsl:variable name="factor3">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="$sumcolumnwidths3 &gt; 0.00000 and $sumcolumnwidths3 &gt; $tablewidth3">
                                                                                        <xsl:value-of select="$tablewidth3 div $sumcolumnwidths3"/>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <xsl:value-of select="1.000"/>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:variable>
                                                                            <xsl:variable name="columnwidth3_0" select="$tablewidth3 * 0.30000 * $factor3"/>
                                                                            <xsl:variable name="columnwidth3_1" select="$tablewidth3 * 0.25000 * $factor3"/>
                                                                            <xsl:variable name="columnwidth3_2" select="$tablewidth3 * 0.45000 * $factor3"/>
                                                                            <fo:table width="{$tablewidth3}in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                                <fo:table-column column-width="{$columnwidth3_0}in"/>
                                                                                <fo:table-column column-width="{$columnwidth3_1}in"/>
                                                                                <fo:table-column column-width="{$columnwidth3_2}in"/>
                                                                                <fo:table-body font-size="8pt">
                                                                                    <xsl:for-each select="n1:OSPAdminList">
                                                                                        <xsl:for-each select="n1:Admin">
                                                                                            <fo:table-row font-size="8pt">
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Name">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth3_0"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text> </xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Phone">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth3_1"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text> </xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Email">
                                                                                                            <fo:basic-link font-size="6pt" text-decoration="underline" color="blue">
                                                                                                                <xsl:choose>
                                                                                                                    <xsl:when test="substring(string(concat('mailto:',.)), 1, 1) = '#'">
                                                                                                                        <xsl:attribute name="internal-destination">
                                                                                                                            <xsl:value-of select="substring(string(concat('mailto:',.)), 2)"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:when>
                                                                                                                    <xsl:otherwise>
                                                                                                                        <xsl:attribute name="external-destination">
                                                                                                                            <xsl:if test="substring(string(concat('mailto:',.)), 2, 1) = ':'">
                                                                                                                                <xsl:text>file:///</xsl:text>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:value-of select="translate(string(concat('mailto:',.)), '&#x5c;', '/')"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:otherwise>
                                                                                                                </xsl:choose>
                                                                                                                <fo:inline font-size="6pt">
                                                                                                                    <xsl:apply-templates/>
                                                                                                                </fo:inline>
                                                                                                            </fo:basic-link>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                            </fo:table-row>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <fo:inline font-size="8pt" font-weight="bold">
                                                                                <xsl:text>PAFO Admin:</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:variable name="tablewidth4" select="$columnwidth0_2 * 1.00000 - 0.01042 - 0.01042"/>
                                                                            <xsl:variable name="sumcolumnwidths4" select="$tablewidth4 * 0.30000 + $tablewidth4 * 0.25000 + $tablewidth4 * 0.45000"/>
                                                                            <xsl:variable name="factor4">
                                                                                <xsl:choose>
                                                                                    <xsl:when test="$sumcolumnwidths4 &gt; 0.00000 and $sumcolumnwidths4 &gt; $tablewidth4">
                                                                                        <xsl:value-of select="$tablewidth4 div $sumcolumnwidths4"/>
                                                                                    </xsl:when>
                                                                                    <xsl:otherwise>
                                                                                        <xsl:value-of select="1.000"/>
                                                                                    </xsl:otherwise>
                                                                                </xsl:choose>
                                                                            </xsl:variable>
                                                                            <xsl:variable name="columnwidth4_0" select="$tablewidth4 * 0.30000 * $factor4"/>
                                                                            <xsl:variable name="columnwidth4_1" select="$tablewidth4 * 0.25000 * $factor4"/>
                                                                            <xsl:variable name="columnwidth4_2" select="$tablewidth4 * 0.45000 * $factor4"/>
                                                                            <fo:table width="{$tablewidth4}in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                                <fo:table-column column-width="{$columnwidth4_0}in"/>
                                                                                <fo:table-column column-width="{$columnwidth4_1}in"/>
                                                                                <fo:table-column column-width="{$columnwidth4_2}in"/>
                                                                                <fo:table-body font-size="8pt">
                                                                                    <xsl:for-each select="n1:PAFOAdminList">
                                                                                        <xsl:for-each select="n1:Admin">
                                                                                            <fo:table-row font-size="8pt">
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Name">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth4_0"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text> </xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Phone">
                                                                                                            <fo:inline font-size="6pt">
                                                                                                                <xsl:apply-templates>
                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth4_1"/>
                                                                                                                </xsl:apply-templates>
                                                                                                            </fo:inline>
                                                                                                            <fo:inline font-size="8pt">
                                                                                                                <xsl:text> </xsl:text>
                                                                                                            </fo:inline>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                                <fo:table-cell font-size="8pt">
                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                        <xsl:for-each select="n1:Email">
                                                                                                            <fo:basic-link font-size="6pt" text-decoration="underline" color="blue">
                                                                                                                <xsl:choose>
                                                                                                                    <xsl:when test="substring(string(concat('mailto:',.)), 1, 1) = '#'">
                                                                                                                        <xsl:attribute name="internal-destination">
                                                                                                                            <xsl:value-of select="substring(string(concat('mailto:',.)), 2)"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:when>
                                                                                                                    <xsl:otherwise>
                                                                                                                        <xsl:attribute name="external-destination">
                                                                                                                            <xsl:if test="substring(string(concat('mailto:',.)), 2, 1) = ':'">
                                                                                                                                <xsl:text>file:///</xsl:text>
                                                                                                                            </xsl:if>
                                                                                                                            <xsl:value-of select="translate(string(concat('mailto:',.)), '&#x5c;', '/')"/>
                                                                                                                        </xsl:attribute>
                                                                                                                    </xsl:otherwise>
                                                                                                                </xsl:choose>
                                                                                                                <fo:inline font-size="6pt">
                                                                                                                    <xsl:apply-templates/>
                                                                                                                </fo:inline>
                                                                                                            </fo:basic-link>
                                                                                                        </xsl:for-each>
                                                                                                    </fo:block>
                                                                                                </fo:table-cell>
                                                                                            </fo:table-row>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </fo:table-body>
                                                                            </fo:table>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                            </fo:table-body>
                                                        </fo:table>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell>
                                                    <fo:block/>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </fo:table-body>
                                    </fo:table>
                                </xsl:for-each>
                                <fo:block>
                                    <fo:block font-size="8pt">
                                        <fo:block font-size="8pt">
                                            <fo:leader leader-pattern="space"/>
                                        </fo:block>
                                        <fo:block font-size="8pt">
                                            <fo:leader leader-pattern="space"/>
                                        </fo:block>
                                        <fo:inline font-size="8pt" font-weight="bold">
                                            <xsl:text>This Action:</xsl:text>
                                        </fo:inline>
                                        <xsl:variable name="tablewidth5" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                        <xsl:variable name="sumcolumnwidths5" select="$tablewidth5 * 0.15000 + $tablewidth5 * 0.20000 + $tablewidth5 * 0.15000 + $tablewidth5 * 0.15000 + $tablewidth5 * 0.10000 + $tablewidth5 * 0.17000 + $tablewidth5 * 0.17000 + $tablewidth5 * 0.20000"/>
                                        <xsl:variable name="factor5">
                                            <xsl:choose>
                                                <xsl:when test="$sumcolumnwidths5 &gt; 0.00000 and $sumcolumnwidths5 &gt; $tablewidth5">
                                                    <xsl:value-of select="$tablewidth5 div $sumcolumnwidths5"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="1.000"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="columnwidth5_0" select="$tablewidth5 * 0.15000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_1" select="$tablewidth5 * 0.20000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_2" select="$tablewidth5 * 0.17000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_3" select="$tablewidth5 * 0.20000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_4" select="$tablewidth5 * 0.10000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_5" select="$tablewidth5 * 0.15000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_6" select="$tablewidth5 * 0.15000 * $factor5"/>
                                        <xsl:variable name="columnwidth5_7" select="$tablewidth5 * 0.17000 * $factor5"/>
                                        <fo:table width="{$maxwidth}in">
                                            <fo:table-column column-width="{0.01042}in"/>
                                            <fo:table-column column-width="{$tablewidth5}in"/>
                                            <fo:table-column column-width="{0.01042}in"/>
                                            <fo:table-body>
                                                <fo:table-row>
                                                    <fo:table-cell>
                                                        <fo:block/>
                                                    </fo:table-cell>
                                                    <fo:table-cell>
                                                        <fo:block>
                                                            <fo:table width="{$tablewidth5}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                <fo:table-column column-width="{$columnwidth5_0}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_1}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_2}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_3}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_4}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_5}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_6}in"/>
                                                                <fo:table-column column-width="{$columnwidth5_7}in"/>
                                                                <fo:table-header font-size="8pt">
                                                                    <fo:table-row font-size="8pt">
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Internal Order #</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Description</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Legacy Source Number</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>PI(s)</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>F&amp;A Rate</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Change to Obligated&#160; Dir.</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Change to Obligated F&amp;A</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:text>Total Change</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                    </fo:table-row>
                                                                </fo:table-header>
                                                                <fo:table-body font-size="8pt">
                                                                    <xsl:for-each select="n1:ObligatedChangeHistory">
                                                                        <xsl:for-each select="n1:ObligatedChange">
                                                                            <fo:table-row font-size="8pt">
                                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:InetrnalOrderNumber">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:apply-templates>
                                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth5_0 - 0.01042 - 0.01042"/>
                                                                                                    </xsl:apply-templates>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:Description">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:apply-templates>
                                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth5_1 - 0.01042 - 0.01042"/>
                                                                                                    </xsl:apply-templates>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:LegacySourceNumber">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:apply-templates>
                                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth5_2 - 0.01042 - 0.01042"/>
                                                                                                    </xsl:apply-templates>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:PI">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:apply-templates>
                                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth5_3 - 0.01042 - 0.01042"/>
                                                                                                    </xsl:apply-templates>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:FnARate">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:value-of select="format-number(number(string(.)), '##0.00')"/>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:ObligatedChangeDirect">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:ObligatedChangeIndirect">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                        <xsl:if test="count(  .  )  &gt; 0">
                                                                                            <xsl:for-each select="n1:TotalChange">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                        </xsl:if>
                                                                                    </fo:block>
                                                                                </fo:table-cell>
                                                                            </fo:table-row>
                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                    <fo:table-row font-size="8pt">
                                                                        <fo:table-cell font-size="8pt" number-columns-spanned="4" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <fo:inline font-size="8pt" font-weight="bold">
                                                                                    <xsl:text>Total Obligated Change Amount:</xsl:text>
                                                                                </fo:inline>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:if test="count(  .  )  &gt; 0">
                                                                                    <xsl:for-each select="n1:ObligatedChangeHistory">
                                                                                        <xsl:for-each select="n1:FnARateTotal">
                                                                                            <fo:inline font-size="8pt">
                                                                                                <!-- Mukadder removed this line to avoid summation of F&A Rate -->
                                                                                                <!-- <xsl:value-of select="format-number(number(string(.)), '##0.00')"/> -->
                                                                                            </fo:inline>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </xsl:if>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:if test="count(  .  )  &gt; 0">
                                                                                    <xsl:for-each select="n1:ObligatedChangeHistory">
                                                                                        <xsl:for-each select="n1:ObligatedChangeDirectTotal">
                                                                                            <fo:inline font-size="8pt">
                                                                                                <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                            </fo:inline>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </xsl:if>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:if test="count(  .  )  &gt; 0">
                                                                                    <xsl:for-each select="n1:ObligatedChangeHistory">
                                                                                        <xsl:for-each select="n1:ObligatedChangeIndrectTotal">
                                                                                            <fo:inline font-size="8pt">
                                                                                                <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                            </fo:inline>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </xsl:if>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:if test="count(  .  )  &gt; 0">
                                                                                    <xsl:for-each select="n1:ObligatedChangeHistory">
                                                                                        <xsl:for-each select="n1:TotalChangeTotal">
                                                                                            <fo:inline font-size="8pt">
                                                                                                <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                            </fo:inline>
                                                                                        </xsl:for-each>
                                                                                    </xsl:for-each>
                                                                                </xsl:if>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                    </fo:table-row>
                                                                </fo:table-body>
                                                            </fo:table>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell>
                                                        <fo:block/>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                            </fo:table-body>
                                        </fo:table>
                                    </fo:block>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>Cumulative Obligated Amount for Grant</xsl:text>
                                </fo:inline>
                                <fo:inline font-size="8pt">
                                    <xsl:text>&#160;</xsl:text>
                                </fo:inline>
                                <xsl:for-each select="n1:AwardHeader">
                                    <xsl:for-each select="n1:SAPGrantNumber">
                                        <fo:inline font-size="8pt">
                                            <xsl:apply-templates/>
                                        </fo:inline>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <fo:inline font-size="8pt">
                                    <xsl:text>&#160;</xsl:text>
                                </fo:inline>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>as of this action:</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <xsl:variable name="tablewidth6" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                <xsl:variable name="sumcolumnwidths6" select="0.000"/>
                                <xsl:variable name="defaultcolumns6" select="1 + 1 + 1 + 1"/>
                                <xsl:variable name="defaultcolumnwidth6">
                                    <xsl:choose>
                                        <xsl:when test="$defaultcolumns6 &gt; 0">
                                            <xsl:value-of select="($tablewidth6 - $sumcolumnwidths6) div $defaultcolumns6"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="0.000"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="columnwidth6_0" select="$defaultcolumnwidth6"/>
                                <xsl:variable name="columnwidth6_1" select="$defaultcolumnwidth6"/>
                                <xsl:variable name="columnwidth6_2" select="$defaultcolumnwidth6"/>
                                <xsl:variable name="columnwidth6_3" select="$defaultcolumnwidth6"/>
                                <fo:table width="{$maxwidth}in">
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-column column-width="{$tablewidth6}in"/>
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block>
                                                    <fo:table width="{$tablewidth6}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                        <fo:table-column column-width="{$columnwidth6_0}in"/>
                                                        <fo:table-column column-width="{$columnwidth6_1}in"/>
                                                        <fo:table-column column-width="{$columnwidth6_2}in"/>
                                                        <fo:table-column column-width="{$columnwidth6_3}in"/>
                                                        <fo:table-header font-size="8pt">
                                                            <fo:table-row font-size="8pt">
                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Obligation Start/End:</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Obligated Direct</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Obligated F&amp;A</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Obligated Total</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-header>
                                                        <fo:table-body font-size="8pt">
                                                            <xsl:for-each select="n1:ObligatedAmountTotal">
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:if test="n1:ObligationStartDate !=&apos;&apos;">
                                                                                <xsl:for-each select="n1:ObligationStartDate">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 6, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 9, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(string(.)), 1, 4)), '0000')"/>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </xsl:if>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>-</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:if test="n1:ObligatedEndDate != &apos; &apos;">
                                                                                <xsl:for-each select="n1:ObligatedEndDate">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 6, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 9, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(string(.)), 1, 4)), '0000')"/>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </xsl:if>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:ObligatedDirectTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:ObligatedIndirectTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:ObligatedTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                            </xsl:for-each>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>Anticipated Amount for Grant</xsl:text>
                                </fo:inline>
                                <fo:inline font-size="8pt">
                                    <xsl:text>&#160;</xsl:text>
                                </fo:inline>
                                <xsl:for-each select="n1:AwardHeader">
                                    <xsl:for-each select="n1:SAPGrantNumber">
                                        <fo:inline font-size="8pt">
                                            <xsl:apply-templates/>
                                        </fo:inline>
                                    </xsl:for-each>
                                </xsl:for-each>
                                <fo:inline font-size="8pt">
                                    <xsl:text>&#160;</xsl:text>
                                </fo:inline>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>as of this action:</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <xsl:variable name="tablewidth7" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                <xsl:variable name="sumcolumnwidths7" select="0.000"/>
                                <xsl:variable name="defaultcolumns7" select="1 + 1 + 1 + 1"/>
                                <xsl:variable name="defaultcolumnwidth7">
                                    <xsl:choose>
                                        <xsl:when test="$defaultcolumns7 &gt; 0">
                                            <xsl:value-of select="($tablewidth7 - $sumcolumnwidths7) div $defaultcolumns7"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="0.000"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="columnwidth7_0" select="$defaultcolumnwidth7"/>
                                <xsl:variable name="columnwidth7_1" select="$defaultcolumnwidth7"/>
                                <xsl:variable name="columnwidth7_2" select="$defaultcolumnwidth7"/>
                                <xsl:variable name="columnwidth7_3" select="$defaultcolumnwidth7"/>
                                <fo:table width="{$maxwidth}in">
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-column column-width="{$tablewidth7}in"/>
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block>
                                                    <fo:table width="{$tablewidth7}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                        <fo:table-column column-width="{$columnwidth7_0}in"/>
                                                        <fo:table-column column-width="{$columnwidth7_1}in"/>
                                                        <fo:table-column column-width="{$columnwidth7_2}in"/>
                                                        <fo:table-column column-width="{$columnwidth7_3}in"/>
                                                        <fo:table-header font-size="8pt">
                                                            <fo:table-row font-size="8pt">
                                                                <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Project Start/End:</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Anticipated Direct</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Anticipated F&amp;A</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:text>Anticipated Total</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-header>
                                                        <fo:table-body font-size="8pt">
                                                            <xsl:for-each select="n1:AnticipatedAmountTotal">
                                                                <fo:table-row font-size="8pt">
                                                                    <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:if test="n1:ProjectStartDate != &apos;&apos;">
                                                                                <xsl:for-each select="n1:ProjectStartDate">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 6, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 9, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(string(.)), 1, 4)), '0000')"/>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </xsl:if>
                                                                            <fo:inline font-size="8pt">
                                                                                <xsl:text>-</xsl:text>
                                                                            </fo:inline>
                                                                            <xsl:if test="n1:ProjectEndDate  !=&apos;&apos;">
                                                                                <xsl:for-each select="n1:ProjectEndDate">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 6, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(.), 9, 2)), '00')"/>
                                                                                        <xsl:text>/</xsl:text>
                                                                                        <xsl:value-of select="format-number(number(substring(string(string(.)), 1, 4)), '0000')"/>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </xsl:if>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:AnticipatedDirectTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)),  '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:AnticipatedIndirectTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                    <fo:table-cell font-size="8pt" text-align="right" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                            <xsl:for-each select="n1:AnticipatedTotal">
                                                                                <fo:inline font-size="8pt">
                                                                                    <xsl:value-of select="format-number(number(string(.)), '###,##0.00')"/>
                                                                                </fo:inline>
                                                                            </xsl:for-each>
                                                                        </fo:block>
                                                                    </fo:table-cell>
                                                                </fo:table-row>
                                                            </xsl:for-each>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>

                                <fo:block>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>PIs can access a line-item budget for each Sponsored Program/Internal Order above, through
                                        </xsl:text>
                                    </fo:inline>
                                    <fo:inline font-size="8pt" font-weight="bold">
                                        <xsl:text>My Grant Expenses</xsl:text>
                                    </fo:inline>
                                    <fo:inline font-size="8pt">
                                        <xsl:text> (</xsl:text>
                                    </fo:inline>
                                    <fo:basic-link
                                            external-destination="url('http://www.bu.edu/research/my-grant-expenses/')"
                                            color="blue" text-decoration="underline">http://www.bu.edu/research/my-grant-expenses/</fo:basic-link>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>). </xsl:text>
                                    </fo:inline>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>DAs can access detailed budget and other information by visiting the Business Warehouse (</xsl:text>
                                    </fo:inline>
                                    <fo:basic-link external-destination="url('https://ppo.buw.bu.edu/')"
                                                   color="blue" text-decoration="underline">https://ppo.buw.bu.edu/</fo:basic-link>
                                    <!-- <fo:basic-link font-size="8pt" text-decoration="underline" color="blue">
                                        <xsl:choose>
                                            <xsl:when test="substring(string(concat('https://ppo.buw.bu.edu/',.,'https://ppo.buw.bu.edu/')), 1, 1) = '#'">
                                                <xsl:attribute name="internal-destination">
                                                    <xsl:value-of select="substring(string(concat('https://ppo.buw.bu.edu/',.,'https://ppo.buw.bu.edu/')), 2)"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="external-destination">
                                                    <xsl:if test="substring(string(concat('https://ppo.buw.bu.edu/',.,'https://ppo.buw.bu.edu/')), 2, 1) = ':'">
                                                        <xsl:text>file:///</xsl:text>
                                                    </xsl:if>
                                                    <xsl:value-of select="translate(string(concat('https://ppo.buw.bu.edu/',.,'https://ppo.buw.bu.edu/')), '&#x5c;', '/')"/>
                                                </xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <fo:inline font-size="8pt">
                                            <xsl:text>Business Warehouse</xsl:text>
                                        </fo:inline>
                                    </fo:basic-link> -->
                                    <fo:inline font-size="8pt">
                                        <xsl:text>). </xsl:text>
                                    </fo:inline>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>Please note that Principal Investigators are responsible for reviewing budget information to confirm that their accounts are set up correctly, as well as for ongoing monitoring of account expenses to prevent overexpenditures.
                                        </xsl:text>
                                    </fo:inline>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block text-align="center" space-before.optimum="-8pt">
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>Comments:</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <xsl:variable name="tablewidth8" select="$maxwidth * 1.00000"/>
                                <xsl:variable name="sumcolumnwidths8" select="0.02083"/>
                                <xsl:variable name="defaultcolumns8" select="1"/>
                                <xsl:variable name="defaultcolumnwidth8">
                                    <xsl:choose>
                                        <xsl:when test="$defaultcolumns8 &gt; 0">
                                            <xsl:value-of select="($tablewidth8 - $sumcolumnwidths8) div $defaultcolumns8"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="0.000"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="columnwidth8_0" select="$defaultcolumnwidth8"/>
                                <xsl:if test="n1:Comments/n1:Comment/n1:CommentTxt!=&apos;&apos; ">
                                    <fo:table width="{$tablewidth8}in" border-collapse="separate" border-separation="0.02083in" font-size="8pt" color="black" display-align="center">
                                        <fo:table-column column-width="{$columnwidth8_0}in"/>
                                        <fo:table-body font-size="8pt">
                                            <xsl:for-each select="n1:Comments">
                                                <xsl:for-each select="n1:Comment">
                                                    <fo:table-row font-size="8pt">
                                                        <fo:table-cell font-size="8pt" padding-top="0.01042in" padding-bottom="0.01042in" padding-left="0.01042in" padding-right="0.01042in">
                                                            <fo:block padding-top="1pt" padding-bottom="1pt" white-space-collapse="false" linefeed-treatment="preserve"    >
                                                                    <xsl:for-each select="n1:CommentTxt">
                                                                        <fo:inline font-size="8pt">
                                                                            <xsl:apply-templates>
                                                                                <xsl:with-param name="maxwidth" select="$columnwidth8_0 - 0.01042 - 0.01042"/>
                                                                            </xsl:apply-templates>
                                                                        </fo:inline>
                                                                    </xsl:for-each>
                                                            </fo:block>
                                                        </fo:table-cell>
                                                    </fo:table-row>
                                                </xsl:for-each>
                                            </xsl:for-each>
                                        </fo:table-body>
                                    </fo:table>
                                </xsl:if>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block text-align="center" >
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>Please see sponsor documentation for any applicable terms and conditions.</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>


                                <!-- mukadder -->
                                <!-- <xsl:when test="n1:TermsAndConditions/n1:TermAndCondition"> -->
                                <xsl:choose>
                                    <xsl:when test="count(n1:TermsAndConditions/n1:TermAndCondition) &gt; 1 or n1:TermsAndConditions/n1:TermAndCondition !=&apos;&apos;">


                                        <fo:inline font-size="8pt" font-weight="bold">
                                            <xsl:text>Highlighted Terms and Conditions:</xsl:text>
                                        </fo:inline>
                                        <fo:block font-size="8pt">
                                            <xsl:text>&#xA;</xsl:text>
                                        </fo:block>
                                        <xsl:variable name="tablewidth9" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                        <xsl:variable name="sumcolumnwidths9" select="0.000"/>
                                        <xsl:variable name="defaultcolumns9" select="1 + 1"/>
                                        <xsl:variable name="defaultcolumnwidth9">
                                            <xsl:choose>
                                                <xsl:when test="$defaultcolumns9 &gt; 0">
                                                    <xsl:value-of select="($tablewidth9 - $sumcolumnwidths9) div $defaultcolumns9"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="0.000"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <xsl:variable name="columnwidth9_0" select="$defaultcolumnwidth9"/>
                                        <xsl:variable name="columnwidth9_1" select="$defaultcolumnwidth9"/>
                                        <fo:table width="{$maxwidth}in">
                                            <fo:table-column column-width="{0.01042}in"/>
                                            <fo:table-column column-width="{$tablewidth9}in"/>
                                            <fo:table-column column-width="{0.01042}in"/>
                                            <fo:table-body>
                                                <fo:table-row>
                                                    <fo:table-cell>
                                                        <fo:block/>
                                                    </fo:table-cell>
                                                    <fo:table-cell>
                                                        <fo:block>
                                                            <fo:table width="{$tablewidth9}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                <fo:table-column column-width="{$columnwidth9_0}in"/>
                                                                <fo:table-column column-width="{$columnwidth9_1}in"/>
                                                                <fo:table-body font-size="8pt">
                                                                    <xsl:for-each select="n1:TermsAndConditions">
                                                                        <xsl:for-each select="n1:TermAndCondition">

                                                                            <xsl:if test=". !=&apos;&apos;">

                                                                                <fo:table-row font-size="8pt">
                                                                                    <fo:table-cell font-size="8pt" number-columns-spanned="2" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                            <xsl:for-each select="n1:TermType">
                                                                                                <fo:inline font-size="8pt">
                                                                                                    <xsl:apply-templates>
                                                                                                        <xsl:with-param name="maxwidth" select="$columnwidth9_0 + $columnwidth9_1 - 0.01042 - 0.01042"/>
                                                                                                    </xsl:apply-templates>
                                                                                                </fo:inline>
                                                                                            </xsl:for-each>
                                                                                            <xsl:variable name="tablewidth10" select="$columnwidth9_0 * 1.00000 + $columnwidth9_1 * 1.00000 - 0.01042 - 0.01042"/>
                                                                                            <xsl:variable name="sumcolumnwidths10" select="0.000"/>
                                                                                            <xsl:variable name="defaultcolumns10" select="1"/>
                                                                                            <xsl:variable name="defaultcolumnwidth10">
                                                                                                <xsl:choose>
                                                                                                    <xsl:when test="$defaultcolumns10 &gt; 0">
                                                                                                        <xsl:value-of select="($tablewidth10 - $sumcolumnwidths10) div $defaultcolumns10"/>
                                                                                                    </xsl:when>
                                                                                                    <xsl:otherwise>
                                                                                                        <xsl:value-of select="0.000"/>
                                                                                                    </xsl:otherwise>
                                                                                                </xsl:choose>
                                                                                            </xsl:variable>
                                                                                            <xsl:variable name="columnwidth10_0" select="$defaultcolumnwidth10"/>
                                                                                            <fo:table width="{$tablewidth10}in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                                                                <fo:table-column column-width="{$columnwidth10_0}in"/>
                                                                                                <fo:table-body font-size="8pt">
                                                                                                    <xsl:for-each select="n1:Terms">
                                                                                                        <xsl:for-each select="n1:Term">
                                                                                                            <fo:table-row font-size="8pt">
                                                                                                                <fo:table-cell font-size="8pt">
                                                                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                                                        <fo:inline font-size="8pt">
                                                                                                                            <xsl:text>&#160;</xsl:text>
                                                                                                                        </fo:inline>
                                                                                                                        <xsl:for-each select="n1:TermTxt">
                                                                                                                            <fo:inline font-size="8pt">
                                                                                                                                <xsl:apply-templates>
                                                                                                                                    <xsl:with-param name="maxwidth" select="$columnwidth10_0"/>
                                                                                                                                </xsl:apply-templates>
                                                                                                                            </fo:inline>
                                                                                                                        </xsl:for-each>
                                                                                                                    </fo:block>
                                                                                                                </fo:table-cell>
                                                                                                            </fo:table-row>
                                                                                                        </xsl:for-each>
                                                                                                    </xsl:for-each>
                                                                                                </fo:table-body>
                                                                                            </fo:table>
                                                                                        </fo:block>
                                                                                    </fo:table-cell>
                                                                                </fo:table-row>

                                                                            </xsl:if>

                                                                        </xsl:for-each>
                                                                    </xsl:for-each>
                                                                </fo:table-body>
                                                            </fo:table>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                    <fo:table-cell>
                                                        <fo:block/>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                            </fo:table-body>
                                        </fo:table>
                                        <fo:block font-size="8pt">
                                            <fo:leader leader-pattern="space"/>
                                        </fo:block>

                                    </xsl:when>

                                    <xsl:otherwise>
                                        <!-- <xsl:text>Recompiled XSLT again!</xsl:text> -->
                                    </xsl:otherwise>

                                </xsl:choose>


                                <fo:block text-align="center" >
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:inline font-size="8pt" font-weight="bold">
                                    <xsl:text>Reporting Requirements:</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <xsl:variable name="tablewidth11" select="$maxwidth * 1.00000 - 0.01042 - 0.01042"/>
                                <xsl:variable name="sumcolumnwidths11" select="0.000"/>
                                <xsl:variable name="defaultcolumns11" select="1 + 1 + 1"/>
                                <xsl:variable name="defaultcolumnwidth11">
                                    <xsl:choose>
                                        <xsl:when test="$defaultcolumns11 &gt; 0">
                                            <xsl:value-of select="($tablewidth11 - $sumcolumnwidths11) div $defaultcolumns11"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="0.000"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="columnwidth11_0" select="$defaultcolumnwidth11"/>
                                <xsl:variable name="columnwidth11_1" select="$defaultcolumnwidth11"/>
                                <xsl:variable name="columnwidth11_2" select="$defaultcolumnwidth11"/>
                                <fo:table width="{$maxwidth}in">
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-column column-width="{$tablewidth11}in"/>
                                    <fo:table-column column-width="{0.01042}in"/>
                                    <fo:table-body>
                                        <fo:table-row>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block>
                                                    <fo:table width="{$tablewidth11}in" border-top-style="solid" border-top-color="#ECE9D8" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ACA899" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ECE9D8" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ACA899" border-right-width="0.01042in" border-collapse="separate" font-size="8pt" color="black" display-align="center">
                                                        <fo:table-column column-width="{$columnwidth11_0}in"/>
                                                        <fo:table-column column-width="{$columnwidth11_1}in"/>
                                                        <fo:table-column column-width="{$columnwidth11_2}in"/>
                                                        <fo:table-header font-size="8pt">
                                                            <fo:table-row font-size="8pt">
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt" font-weight="bold">
                                                                            <xsl:text>Report Class</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt" font-weight="bold">
                                                                            <xsl:text>Type of Report</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                                <fo:table-cell font-size="8pt" text-align="center" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                    <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                        <fo:inline font-size="8pt" font-weight="bold">
                                                                            <xsl:text>Frequency</xsl:text>
                                                                        </fo:inline>
                                                                    </fo:block>
                                                                </fo:table-cell>
                                                            </fo:table-row>
                                                        </fo:table-header>
                                                        <fo:table-body font-size="8pt">
                                                            <xsl:for-each select="n1:ReportingRequirements">
                                                                <xsl:for-each select="n1:ReportingRequirement">
                                                                    <fo:table-row font-size="8pt">
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:for-each select="n1:ReportClass">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:apply-templates>
                                                                                            <xsl:with-param name="maxwidth" select="$columnwidth11_0 - 0.01042 - 0.01042"/>
                                                                                        </xsl:apply-templates>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:for-each select="n1:ReportType">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:apply-templates>
                                                                                            <xsl:with-param name="maxwidth" select="$columnwidth11_1 - 0.01042 - 0.01042"/>
                                                                                        </xsl:apply-templates>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                        <fo:table-cell font-size="8pt" border-top-style="solid" border-top-color="#ACA899" border-top-width="0.01042in" border-bottom-style="solid" border-bottom-color="#ECE9D8" border-bottom-width="0.01042in" border-left-style="solid" border-left-color="#ACA899" border-left-width="0.01042in" border-right-style="solid" border-right-color="#ECE9D8" border-right-width="0.01042in">
                                                                            <fo:block padding-top="1pt" padding-bottom="1pt">
                                                                                <xsl:for-each select="n1:Frequency">
                                                                                    <fo:inline font-size="8pt">
                                                                                        <xsl:apply-templates>
                                                                                            <xsl:with-param name="maxwidth" select="$columnwidth11_2 - 0.01042 - 0.01042"/>
                                                                                        </xsl:apply-templates>
                                                                                    </fo:inline>
                                                                                </xsl:for-each>
                                                                            </fo:block>
                                                                        </fo:table-cell>
                                                                    </fo:table-row>
                                                                </xsl:for-each>
                                                            </xsl:for-each>
                                                        </fo:table-body>
                                                    </fo:table>
                                                </fo:block>
                                            </fo:table-cell>
                                            <fo:table-cell>
                                                <fo:block/>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </fo:table-body>
                                </fo:table>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block text-align="center" space-before.optimum="-8pt">
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:inline font-size="8pt">
                                        <xsl:text>Please note: If you plan to engage a consultant on this project, please consult the BU Sourcing &#038; Procurement guidance on engaging Service Providers and Consultants (</xsl:text>
                                    </fo:inline>
                                    <!-- <fo:basic-link font-size="8pt" text-decoration="underline" color="blue">
                                        <xsl:choose>
                                            <xsl:when test="substring(string(concat('http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ',.,'http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ')), 1, 1) = '#'">
                                                <xsl:attribute name="internal-destination">
                                                    <xsl:value-of select="substring(string(concat('http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ',.,'http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ')), 2)"/>
                                                </xsl:attribute>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:attribute name="external-destination">
                                                    <xsl:if test="substring(string(concat('http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ',.,'http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ')), 2, 1) = ':'">
                                                        <xsl:text>file:///</xsl:text>
                                                    </xsl:if>
                                                    <xsl:value-of select="translate(string(concat('http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ',.,'http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/ ')), '&#x5c;', '/')"/>
                                                </xsl:attribute>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <fo:inline font-size="8pt">
                                            <xsl:text>Service Providers and Consultants </xsl:text>
                                        </fo:inline>
                                    </fo:basic-link> -->
                                    <fo:basic-link external-destination="url('http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/')"
                                                   color="blue" text-decoration="underline">http://www.bu.edu/sourcing/shoppers_guide/service-providers-2/</fo:basic-link>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>) </xsl:text>

                                    </fo:inline>

                                    <fo:inline font-size="8pt">
                                        <xsl:text>to begin the Research Related Consulting Agreement (RRCA) process. </xsl:text>
                                    </fo:inline>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:inline font-size="8pt">
                                    <xsl:text> Research law and policy dictate that no activities considered "human subjects research" can be conducted until full IRB approval is obtained. </xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:inline font-size="8pt">
                                    <xsl:text>Activities that are considered part of "human subjects research," and are thus prohibited until IRB approval is obtained, include any recruitment activities, study interventions including data collection, data analysis, and any collection or analysis of biological specimens. Prohibited recruitment activities include publishing recruitment materials, reviewing medical records to find potentially suitable subjects, contacting potential subjects, and any other activities that are part of the screening or enrollment process. </xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:inline font-size="8pt">
                                    <xsl:text>Some examples of activities that are considered "preparing" for research and are allowable during this restricted phase include hiring, support and training of research staff, preparing study forms and documents, preparing recruitment materials, and preparing IRB applications. If you have questions about whether an activity is allowable prior to IRB approval, please contact the IRB directly (BUMC:</xsl:text>
                                </fo:inline>
                                <fo:basic-link font-size="8pt" text-decoration="underline" color="blue">
                                    <xsl:choose>
                                        <xsl:when test="substring(string(concat('mailto:',.)), 1, 1) = '#'">
                                            <xsl:attribute name="internal-destination">
                                                <xsl:value-of select="substring(string(concat('mailto:',.)), 2)"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="external-destination">
                                                <xsl:if test="substring(string(concat('mailto:',.)), 2, 1) = ':'">
                                                    <xsl:text>file:///</xsl:text>
                                                </xsl:if>
                                                <xsl:value-of select="translate(string(concat('mailto:',.)), '&#x5c;', '/')"/>
                                            </xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <fo:inline font-size="8pt">
                                        <xsl:text> medirb@bu.edu</xsl:text>
                                    </fo:inline>
                                </fo:basic-link>
                                <fo:inline font-size="8pt">
                                    <xsl:text> or X8-7207; CRC: </xsl:text>
                                </fo:inline>
                                <fo:basic-link font-size="8pt" text-decoration="underline" color="blue">
                                    <xsl:choose>
                                        <xsl:when test="substring(string(concat('mailto:',.)), 1, 1) = '#'">
                                            <xsl:attribute name="internal-destination">
                                                <xsl:value-of select="substring(string(concat('mailto:',.)), 2)"/>
                                            </xsl:attribute>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:attribute name="external-destination">
                                                <xsl:if test="substring(string(concat('mailto:',.)), 2, 1) = ':'">
                                                    <xsl:text>file:///</xsl:text>
                                                </xsl:if>
                                                <xsl:value-of select="translate(string(concat('mailto:',.)), '&#x5c;', '/')"/>
                                            </xsl:attribute>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>irb@bu.edu</xsl:text>
                                    </fo:inline>
                                </fo:basic-link>
                                <fo:inline font-size="8pt">
                                    <xsl:text> or 617-358-6115).</xsl:text>
                                </fo:inline>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                               <fo:block font-size="8pt">
                                    <fo:inline font-size="8pt">
                                        <xsl:text>For assistance with all purchasing requirements or needs, please contact the Sourcing &#038; Procurement Office (</xsl:text>
                                    </fo:inline>
                                    <fo:basic-link external-destination="url('http://www.bu.edu/sourcing/contacts-2/')"
                                                   color="blue" text-decoration="underline">http://www.bu.edu/sourcing/contacts-2/</fo:basic-link>
                                    <fo:inline font-size="8pt">
                                        <xsl:text>).</xsl:text>
                                    </fo:inline>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block><fo:inline color="transparent"></fo:inline></fo:block>
                                <fo:block><fo:inline color="transparent"></fo:inline></fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block text-align="center" >
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block>
                                <fo:block><fo:inline color="transparent"></fo:inline></fo:block>
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <xsl:variable name="tablewidth8" select="$maxwidth * 1.00000"/>
                                <xsl:variable name="sumcolumnwidths8" select="0.02083"/>
                                <xsl:variable name="defaultcolumns8" select="1"/>
                                <xsl:variable name="defaultcolumnwidth8">
                                    <xsl:choose>
                                        <xsl:when test="$defaultcolumns8 &gt; 0">
                                            <xsl:value-of select="($tablewidth8 - $sumcolumnwidths8) div $defaultcolumns8"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="0.000"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:variable name="columnwidth8_0" select="$defaultcolumnwidth8"/>
                                <fo:table width="{$tablewidth8}in" border-collapse="separate" border-separation="0.02083in" font-size="8pt" color="black" display-align="center">
                                    <fo:table-column column-width="{$columnwidth8_0}in"/>
                                    <fo:table-body font-size="8pt">
                                        <xsl:for-each select="n1:TimeAndMoneyDocumentNumbers">
                                            <xsl:for-each select="n1:TimeAndMoneyDocumentNumber">
                                                <fo:table-row font-size="8pt">
                                                    <fo:table-cell font-size="8pt" padding-top="0.01042in" padding-bottom="0.01042in" padding-left="0.01042in" padding-right="0.01042in">
                                                        <fo:block padding-top="1pt" padding-bottom="1pt">
                                                            <fo:inline font-size="8pt">
                                                                <fo:inline font-size="8pt" >
                                                                    Reference Numbers (For ROSA use only):
                                                                </fo:inline>
                                                                <xsl:value-of select="." />
                                                            </fo:inline>
                                                        </fo:block>
                                                    </fo:table-cell>
                                                </fo:table-row>
                                            </xsl:for-each>
                                        </xsl:for-each>
                                    </fo:table-body>
                                </fo:table>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                                <!-- <fo:block text-align="center" space-before.optimum="-8pt">
                                    <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="2pt"/>
                                </fo:block> -->
                                <fo:block font-size="8pt">
                                    <xsl:text>&#xA;</xsl:text>
                                </fo:block>
                                <fo:block font-size="8pt">
                                    <fo:leader leader-pattern="space"/>
                                </fo:block>
                            </xsl:for-each>
                        </xsl:for-each>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
    <xsl:template name="headerodd">
        <xsl:variable name="maxwidth" select="7.30000"/>
        <fo:static-content flow-name="odd-page-header">
            <fo:block>
                <xsl:variable name="tablewidth12" select="$maxwidth * 1.00000"/>
                <xsl:variable name="sumcolumnwidths12" select="$tablewidth12 * 0.20000 + 0.04167 + $tablewidth12 * 1.00000 + 0.04167 + 0.04167"/>
                <xsl:variable name="factor12">
                    <xsl:choose>
                        <xsl:when test="$sumcolumnwidths12 &gt; 0.00000 and $sumcolumnwidths12 &gt; $tablewidth12">
                            <xsl:value-of select="$tablewidth12 div $sumcolumnwidths12"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="1.000"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="defaultcolumns12" select="1"/>
                <xsl:variable name="defaultcolumnwidth12">
                    <xsl:choose>
                        <xsl:when test="$factor12 &lt; 1.000">
                            <xsl:value-of select="0.000"/>
                        </xsl:when>
                        <xsl:when test="$defaultcolumns12 &gt; 0">
                            <xsl:value-of select="($tablewidth12 - $sumcolumnwidths12) div $defaultcolumns12"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0.000"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="columnwidth12_0" select="$tablewidth12 * 0.20000 * $factor12"/>
                <xsl:variable name="columnwidth12_1" select="$tablewidth12 * 1.00000 * $factor12"/>
                <xsl:variable name="columnwidth12_2" select="$defaultcolumnwidth12"/>
                <fo:table width="{$tablewidth12}in" border-collapse="separate" border-separation="0.04167in" font-size="8pt" color="black" display-align="center">
                    <fo:table-column column-width="{$columnwidth12_0}in"/>
                    <fo:table-column column-width="{$columnwidth12_1}in"/>
                    <fo:table-column column-width="{$columnwidth12_2}in"/>
                    <fo:table-body font-size="8pt">
                        <fo:table-row font-size="8pt">
                            <fo:table-cell font-size="8pt" height="0.31250in" number-columns-spanned="3" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt"/>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-size="8pt" text-align="center">
                            <fo:table-cell font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" display-align="before" text-align="left" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt">
                                    <xsl:if test="//n1:AwardNotice/n1:BULogoPath !=&apos;&apos;">
                                        <fo:external-graphic font-size="8pt">
                                            <xsl:attribute name="src">
                                                <xsl:if test="substring(string($XML1/n1:AwardNotice/n1:BULogoPath), 2, 1) = ':'">
                                                    <xsl:text>file:///</xsl:text>
                                                </xsl:if>
                                                <xsl:value-of select="translate(string($XML1/n1:AwardNotice/n1:BULogoPath), '&#x5c;', '/')"/>
                                            </xsl:attribute>
                                        </fo:external-graphic>
                                    </xsl:if>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" text-align="center" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt">
                                    <fo:block font-size="18pt" font-weight="bold">
                                        <fo:block font-size="8pt">
                                            <fo:inline font-size="inherited-property-value(&apos;font-size&apos;) + 4pt" font-weight="bold">
                                                <xsl:text>Sponsored Programs Award Notification</xsl:text>
                                            </fo:inline>
                                        </fo:block>
                                    </fo:block>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-size="8pt">
                            <fo:table-cell font-size="8pt" number-columns-spanned="3" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt">
                                    <fo:block text-align="center" space-before.optimum="-8pt">
                                        <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="1pt" color="black"/>
                                    </fo:block>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="headereven">
        <xsl:variable name="maxwidth" select="7.30000"/>
        <fo:static-content flow-name="even-page-header">
            <fo:block/>
        </fo:static-content>
    </xsl:template>
    <xsl:template name="footerall">
        <xsl:variable name="maxwidth" select="7.30000"/>
        <fo:static-content flow-name="xsl-region-after">
            <fo:block>
                <xsl:variable name="tablewidth13" select="$maxwidth * 1.00000"/>
                <xsl:variable name="sumcolumnwidths13" select="0.04167 + 1.56250 + 0.04167"/>
                <xsl:variable name="factor13">
                    <xsl:choose>
                        <xsl:when test="$sumcolumnwidths13 &gt; 0.00000 and $sumcolumnwidths13 &gt; $tablewidth13">
                            <xsl:value-of select="$tablewidth13 div $sumcolumnwidths13"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="1.000"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="defaultcolumns13" select="1"/>
                <xsl:variable name="defaultcolumnwidth13">
                    <xsl:choose>
                        <xsl:when test="$factor13 &lt; 1.000">
                            <xsl:value-of select="0.000"/>
                        </xsl:when>
                        <xsl:when test="$defaultcolumns13 &gt; 0">
                            <xsl:value-of select="($tablewidth13 - $sumcolumnwidths13) div $defaultcolumns13"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="0.000"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="columnwidth13_0" select="$defaultcolumnwidth13"/>
                <xsl:variable name="columnwidth13_1" select="1.56250 * $factor13"/>
                <fo:table width="{$tablewidth13}in" border-collapse="separate" border-separation="0.04167in" font-size="8pt" color="black" display-align="center">
                    <fo:table-column column-width="{$columnwidth13_0}in"/>
                    <fo:table-column column-width="{$columnwidth13_1}in"/>
                    <fo:table-body font-size="8pt">
                        <fo:table-row font-size="8pt">
                            <fo:table-cell font-size="8pt" number-columns-spanned="2" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt">
                                    <fo:block font-size="8pt">
                                        <fo:leader leader-pattern="space"/>
                                    </fo:block>
                                    <fo:block text-align="center" space-before.optimum="-8pt">
                                        <fo:leader leader-length="100%" leader-pattern="rule" rule-thickness="1pt" color="black"/>
                                    </fo:block>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row font-size="8pt">
                            <fo:table-cell font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" text-align="left" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt">
                                    <fo:inline font-size="8pt" font-weight="bold">
                                        <xsl:text>Page: </xsl:text>
                                    </fo:inline>
                                    <fo:page-number font-size="8pt" font-weight="bold"/>
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell font-size="inherited-property-value(&apos;font-size&apos;) - 2pt" text-align="right" padding-top="0.00000in" padding-bottom="0.00000in" padding-left="0.00000in" padding-right="0.00000in">
                                <fo:block padding-top="1pt" padding-bottom="1pt"/>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:static-content>
    </xsl:template>
</xsl:stylesheet>