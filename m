Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5080B51AF11
	for <lists+linux-doc@lfdr.de>; Wed,  4 May 2022 22:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237652AbiEDUdO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 May 2022 16:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343665AbiEDUdO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 16:33:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88B0F4F9CE
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 13:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=/qqV45pf9tDtxRN0d4Yb9gkm6Hqp8WvOMMkH0L7ncLw=; b=DzwZYqwSE+ZxEYbCR2SE5siWbz
        BHkWnCcWlr7+Lfpui5gavQFRw51EXUVmb0EAXI2Unw43+hpI4xARTRhCPfUfpPkk4nSjDkQ+PlyhC
        C19yoPDrU6JKWDQVz6wmVH9t8WmRYw5dHdL11yMNYPHYQUT8ER9t0blHkgZ54vZ/X7TQvdZKXe7pI
        LMU7gWrX3o/CG81PjdIFBK/PZyc7CK0vJB3A9Xi4Ffirsny72Vx30KtorwaOu4jxrFHWI8YhI8l5O
        Fqwd3FGw+ionWM/c5Ed6MKl0ukun7lJr/sCIr9n2o4UHeh3EC1riMJge6RVx2iirE3zi/1IJQ95Rm
        xz4VnFgA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nmLco-00GvTi-BJ; Wed, 04 May 2022 20:29:30 +0000
Date:   Wed, 4 May 2022 21:29:30 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnLiKnVdBFYLtCJe@casper.infradead.org>
References: <20220503063032.3680308-1-willy@infradead.org>
 <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20c73284-66e5-8e3a-aa78-01f982720aea@nvidia.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 04, 2022 at 06:12:09AM -0700, John Hubbard wrote:
> This needs to be properly merged with the existing index. Otherwise
> the result here is very confusing because there are two summaries
> and no explanation of what is going on here.
> 
> If I get a moment today, I'll take a quick shot at at merging them,
> and post some suggestions here, but just wanted to point that out
> before this goes in as-is.

John and I have chatted to understand what he was getting at here,
but haven't had a chance to review this change in-person yet.

+++ b/Documentation/vm/index.rst
@@ -2,6 +2,9 @@
 Linux Memory Management Documentation
 =====================================

+Memory Management Guide
+=======================
+
 This is a guide to understanding the memory management subsystem
 of Linux.  If you are looking for advice on simply allocating memory,
 see the :ref:`memory_allocation`.  For controlling and tuning guides,
@@ -24,10 +27,14 @@ see the :doc:`admin guide <../admin-guide/mm/index>`.
    shmfs
    oom
 
-This is a collection of documents about the Linux memory management (mm)
-subsystem internals with different level of details ranging from notes and
-mailing list responses for elaborating descriptions of data structures and
-algorithms.
+Legacy Documentation
+====================
+
+This is a collection of older documents about the Linux memory management
+(mm) subsystem internals with different level of details ranging from
+notes and mailing list responses for elaborating descriptions of data
+structures and algorithms.  It should all be integrated nicely into the
+above structured documentation, or deleted if it has served its purpose.
 
 .. toctree::
    :maxdepth: 1

