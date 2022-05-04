Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16051AA03
	for <lists+linux-doc@lfdr.de>; Wed,  4 May 2022 19:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349499AbiEDRUv (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 4 May 2022 13:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357764AbiEDRPO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 May 2022 13:15:14 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2E85537A
        for <linux-doc@vger.kernel.org>; Wed,  4 May 2022 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=G9CYAFgjEFJVFfgeVxF6QR3/r1A0NzaXSI5t29BpqBw=; b=NM9yJEb/bfV1DBnvb97vQthttD
        26R/76QsjCDQ6ABIj5RZ5obsgPvKF6zX4uC4qPfqxB2SBOI2/ver9mGQ4w/5C6KatDG/sNQF0xhZD
        lstB+vAqmWgiwb0fYYMm73Tjt/5P9XeGjeKytB00k+afmxlcGTUdvZfgwQ889lqnfivWdzJc73/Q/
        qw+EuieYQYGCDLI5e3POFz4Z3kmA5NxasfHaGJnQIrweV6VhyS1FuMoTfG3sPT3/0UPiisP062Tyo
        P6/2y6n2Txv4SBJBEBaP4uLWXfpNDEJb6kk2Z3t2KZgEVlNqSQesApftplA+BX3KTSw7/rt5P4+Rj
        1kIDUXqQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nmIL1-00Gktk-G8; Wed, 04 May 2022 16:58:55 +0000
Date:   Wed, 4 May 2022 17:58:55 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] mm,doc: Add new documentation structure
Message-ID: <YnKwzw+1hElMGt68@casper.infradead.org>
References: <20220503063032.3680308-1-willy@infradead.org>
 <YnIdepZMH2HgoTx+@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnIdepZMH2HgoTx+@debian.me>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 04, 2022 at 01:30:18PM +0700, Bagas Sanjaya wrote:
> On Tue, May 03, 2022 at 07:30:32AM +0100, Matthew Wilcox (Oracle) wrote:
> > Closely following the outline of Mel Gorman's book "Understanding the
> > Linux Virtual Memory Manager", add a new outline.  Preserve the current

                                   ^^^^^^^^^^^^^^^^^

> These new documents are stub, right?
