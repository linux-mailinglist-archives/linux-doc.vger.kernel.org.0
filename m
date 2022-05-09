Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E286A520757
	for <lists+linux-doc@lfdr.de>; Tue, 10 May 2022 00:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230518AbiEIWMh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 May 2022 18:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbiEIWMh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 18:12:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 145CF2B4CB6
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 15:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=2BbbKZ+4e7nU8y8IBBlDD/NBX/QmJn+kOjAWFHZQ8kQ=; b=QKroCUvKHru7Jj3A6zmFifhAlk
        8R25KZXsN8hb2N2GCxj0FZEwxEgMjyV4cq9P3XmMMRwimiJG0+X4bgSYT7eaE8QzAa9yfLdljjf/g
        oU3JmffphO2BOfV92xS0yNZQ25+4Vp4Fpa2vOg/k522ELlo710DlLtRUP/igVmVQdt3qzDGy2ogRk
        vicbo2Z7ynmZ3RfCdR6Ir5yVK4VlkqvKs8ofCKQwWUkzyBSTl8KE/mAvF9aQu3NA48jy3h6j1RgXS
        tDW2b/+AnfNQWhsTB5+GaTZrgo6snrhZVlw2TIcdpFNjaEkgcXZgT+Dh+elpNCWoKw3+W539lz52I
        i67Pwx7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1noBYR-003ql5-LJ; Mon, 09 May 2022 22:08:35 +0000
Date:   Mon, 9 May 2022 23:08:35 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        John Hubbard <jhubbard@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] mm,doc: Add new documentation structure
Message-ID: <YnmQ4yQMuv44n8aR@casper.infradead.org>
References: <20220507134947.444287-1-willy@infradead.org>
 <87sfpicr4x.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sfpicr4x.fsf@meer.lwn.net>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 09, 2022 at 03:50:22PM -0600, Jonathan Corbet wrote:
> "Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> 
> > Closely following the outline of Mel Gorman's book "Understanding the
> > Linux Virtual Memory Manager", add a new outline.  Preserve the current
> > contents of the mm underneath the new outline so we can transition those
> > documents to a more sensible place later.
> >
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> So this seems like a good start to me.
> 
> What's your intended path for merging this?  You didn't copy me so I'm
> assuming you had some other way in mind.

Uh, good point.  I didn't cc either you or Andrew.  I don't think it
matters which one of you takes it.  Since you responded first, do you
want to take it?
