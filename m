Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7332A05E3
	for <lists+linux-doc@lfdr.de>; Fri, 30 Oct 2020 13:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbgJ3MxV (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 30 Oct 2020 08:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726610AbgJ3MxU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Oct 2020 08:53:20 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173D3C0613D2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2020 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=MdHoYJIsbz0WiHNH8IuwLqw6ZB6HH6Ep+/40Py000bg=; b=tgG48m1DEsSVv8mEcJrZIzv5RH
        aMnEsw/VLXuJYLoAcIyqy6eWrIrk3oEjfwQKN8d2hd2oGwnxuMoWgkfs4UpABluKPpFynqG8eZ0uw
        JvjHuE/jdabOKrSCScC7aA03eNvYbtMEJsyt9gQ13dCA9YB27TeP1GLf6OirnDaMOHjXT/F03wn78
        oGats/PoR/nHSw9372L5LJ+QTjnpBh1OF5lj2lqbtqBmhdm8Q8fehTIynk7yGyt/Elf0cZtlUY4Vt
        MKERwLIGiBOfneg0t0/EFsSHsLDBkGltxeaHlPcKemDhBAbQt3+QFB4tiEP9xLUE/XGYdEE45UmPO
        wXPKXeog==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kYTu6-0001dq-2O; Fri, 30 Oct 2020 12:53:14 +0000
Date:   Fri, 30 Oct 2020 12:53:13 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: excess bolding in html
Message-ID: <20201030125313.GH27442@casper.infradead.org>
References: <31362b3b-469f-1f74-d929-b6faa7ae4e30@infradead.org>
 <20201030083748.4db9848b@coco.lan>
 <20201030113147.GG27442@casper.infradead.org>
 <db164a2a-83f1-efd0-1c73-a4a77785bb59@darmarit.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db164a2a-83f1-efd0-1c73-a4a77785bb59@darmarit.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 30, 2020 at 01:28:59PM +0100, Markus Heiser wrote:
> Am 30.10.20 um 12:31 schrieb Matthew Wilcox:
> > On Fri, Oct 30, 2020 at 08:37:48AM +0100, Mauro Carvalho Chehab wrote:
> > > Just changing the kernel-doc markup at kernel/futex.c:
> > > 
> > > 	/**
> > > 	 * futex_setup_timer - set up the sleeping hrtimer.
> > > 	 * @time:	ptr to the given timeout value
> > > 	 * @timeout:	the hrtimer_sleeper structure to be set up
> > > 	 * @flags:	futex flags
> > > 	 * @range_ns:	optional range in ns
> > > 	 *
> > > 	 * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
> > > 	 *	   value given
> > > 	 */
> > > 
> > > To:
> > > 
> > > ...
> > > 	 * Return:
> > > 	 *
> > > 	 * Initialized hrtimer_sleeper structure or NULL if no timeout
> > > 	 * value given
> > > 	 */
> > > 
> > > Should fix it.
> > 
> > Or just remove the indent.
> > 
> >   * Return: Initialized hrtimer_sleeper structure or NULL if no timeout
> >   * value given.
> 
> To add my 2 cent:
> 
> The return value should be described in a dedicated section
> named "Return:", like shown im Mauro's example (compare [1]).
> 
> For on-liners I think it is OK to use the short form (compare [2]).
> 
> [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#return-values
> [2] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#function-documentation

Right.  I'm saying that Mauro's suggestion is overly verbose and removing
the whitespace is the solution least likely to bring down the Wrath of
peterz.
