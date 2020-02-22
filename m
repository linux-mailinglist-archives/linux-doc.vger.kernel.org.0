Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 108E4168BE6
	for <lists+linux-doc@lfdr.de>; Sat, 22 Feb 2020 02:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727614AbgBVB6L (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 21 Feb 2020 20:58:11 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:33858 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbgBVB6L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Feb 2020 20:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ccaOP4I4V78xPVEeTBxRAsgWcL2Yr/VIZyU3H+gqcWw=; b=e+VXmCns31Mhywppcb6YGHa2IA
        G2UpuoM3puJvkqZ8sh0bp4s4PJJGqeviK/7IBrB+eg7h70NtDQxuHGD+T9Mhre35dVCyJv6aU4QCL
        MGhqC0BnOoWtug3PxEniEBiccOGiC1xNKTImVdYrDkpx9YSLLddaODLrkakU9XO24SUsVGVgah3ke
        aZpeh5U8V4SwX/xx8Lh8TlbFNMZVjhWPWMaS56z1hOyREYDmG0Kaiy0h4d6ezYHmzBRXu5sTpJQyn
        /ArXzPk3E7arH/f4PxD/Ts0Oh+j6ev8ewZwIAnen0qlxKUHaIN+6CnhTNisTaSsRx1Zhd2n6xuWqI
        mNZb17dg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j5K3W-0002HE-LZ; Sat, 22 Feb 2020 01:58:10 +0000
Date:   Fri, 21 Feb 2020 17:58:10 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm: Add pagemap.h to the fine documentation
Message-ID: <20200222015810.GI24185@bombadil.infradead.org>
References: <20200221220045.24989-1-willy@infradead.org>
 <dca6710c-fecc-9d5d-4ada-6a437811bacc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dca6710c-fecc-9d5d-4ada-6a437811bacc@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 21, 2020 at 02:35:52PM -0800, John Hubbard wrote:
> On 2/21/20 2:00 PM, Matthew Wilcox wrote:
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > 
> > The documentation currently does not include the deathless prose
> 
> Yea, documentation!
> 
> > written to describe functions in pagemap.h because it's not included
> > in any rst file.  Fix up the mismatches between parameter names and the
> 
> Maybe "Fix up some of the mismatches"? ...below:

Nono, it fixes up all the _sphinx warnings_.  Not our grand plan to rename
the world ;-)

> Anyway, I also ran 'make htmldocs' on this and poked around, and everything looks
> like it should, so:
> 
>     Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks!  Jon, do you want to take this through your tree?  I know I
tagged it as mm, but this seems more like a doc patch than an mm patch.
