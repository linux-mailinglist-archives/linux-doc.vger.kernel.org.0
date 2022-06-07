Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1166D53CC68
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jun 2022 17:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245331AbiFCPjE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jun 2022 11:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239078AbiFCPjE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 11:39:04 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2392B274
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=pOPlBSiQmc9RMgazWprQ7xWrfrQ7quspunXp4spezqc=; b=ZjPlMlrTsl/oRY1AuXM9/QgYPp
        GYIoqeNQP99Nog4A0Hy+7vUlz24nykUjVNu8l92c1TtrVLCdGN71wnHEH+7VBY4X2hpX+k7fRzlc0
        A4wvGOKs5zNGFqtRzSTMZjvtkfG7AOwKbZLWL4LwwCkONt6/QpX+W5a1JhThFBIxenAR/gR1NgB/w
        Q5asUkcvKvF+05NBoYfkL7pl5MgUBH/4YdxQ4Et2dfBxsJAVrGzaRhE+v4GLbVnF7s5AsgrOcEtJd
        mCdkZUydUxc3vpY4t5Krzs0+YichIGsLl9Q3gUMIx5Hn6nDZJ3rgqKM8fChB/RwmLBpyGEeYs6X0v
        xoDoS+Jg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nx9O5-007ymt-6e; Fri, 03 Jun 2022 15:38:57 +0000
Date:   Fri, 3 Jun 2022 16:38:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Adam Turner <aaturnerpython@outlook.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <YporEWa2eV2Rvj3X@casper.infradead.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
 <LO3P123MB26812980BECD5299A27BA163C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LO3P123MB26812980BECD5299A27BA163C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 03, 2022 at 03:30:29PM +0000, Adam Turner wrote:
> > There's a bug I've been meaning to track down & report where _some_ links
> > are broken when building with the Sphinx natively installed on my system
> > (Debian 4.3.2-1).  I haven't bothered because (a) life is short and (b)
> > it's not affecting the kernel.org build.  If we're going to ask
> > kernel.org to move to a newer version of Sphinx, we should make sure
> > that the links won't be broken on whatever version we pick.
> 
> > An example:
> > <span class="kt"><span class="pre">void</span></span><span class="w"> </span><span class="p"><span class="pre">*</span></span><span class="sig-name descname"><span class="n"><span class="pre">kmap_local_folio</span></span></span><span class="sig-paren">(</span><span class="k"><span class="pre">struct</span></span><span class="w"> </span><a class="reference internal" href="#c.kmap_local_folio" title="folio"><span class="n"><span class="pre">folio</span></span></a><span class="w"> </span><span class="p"><span class="pre">*</span></span><span class="n"><span class="pre">folio</span></span>, <span class="n"><span class="pre">size_t</span></span><span class="w"> </span><span class="n"><span class="pre">offset</span></span><span class="sig-paren">)</span><a class="headerlink" href="#c.kmap_local_folio" title="Permalink to this definition">�</a><br /></dt>
> 
> > Other than that being a big pile of html, that <a href> around 'folio'
> > should be a link to struct folio and not back to the c.kmap_local_folio
> > anchor.
> 
> > I appreciate this is not a great bug report, but I find the entire
> > build system beyond my comprehension.
> 
> Do you have the reST source behind this rendered HTML? I can then try
> and find a minimal reproducer and see if we can fix within Sphinx.

Alas, I don't.  I don't even know if this is a Sphinx bug or if it's a
bug in one of the kernel addons.  It's generated by scripts/kernel-doc
from:

/**
 * kmap_local_folio - Map a page in this folio for temporary usage
 * @folio: The folio containing the page.
 * @offset: The byte offset within the folio which identifies the page.
 *
...
 */
static inline void *kmap_local_folio(struct folio *folio, size_t offset);

I see an intermediate file in
Documentation/output/_sources/vm/highmem.rst.txt
but that doesn't include the output from scripts/kernel-doc.

This is why I've been reluctant to report it; I lack enough
understanding to be useful :-(
