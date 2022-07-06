Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0B5656906D
	for <lists+linux-doc@lfdr.de>; Wed,  6 Jul 2022 19:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbiGFRPq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 6 Jul 2022 13:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiGFRPq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 13:15:46 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 422582981D
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 10:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=qwiGPgzirneBh5RNdiNAdAQF+8Xv2h/kCrWjmD9tJWU=; b=WOoU9SOCmphmiwcmUiex5OFyPH
        va2Amaxqa9cBEOeNW2ScR3hNjVIcr/aTboIUWNAzzAsNjLrmKM2kpV03ctpWGDTIVEBD7e2VWkiLl
        bjuDM4Y6K54lgatpoJCKAHrbaq/keOGZq6N/DGODOgMkJBv4R6XVKks2W/qW/xo33qg/HYrJ6RDVi
        nuyrLiMnih5/ArG55tTT1Lg4WMzbnbz2R7KUqoqPT19ybzrQewtT2vG7hHNVJxBBT9HV5jK45mVEi
        Dxh57kesTbeD1GVKT0A1DdLfIVLpnjRjd3XhR2EUBgDPMELrrSx7M8wPd/QEB8nNPjdBs/oeAbrDR
        CgUjbVJg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o98cp-001pEs-Gd
        for linux-doc@vger.kernel.org; Wed, 06 Jul 2022 17:15:43 +0000
Date:   Wed, 6 Jul 2022 18:15:43 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Subject: How to cross-link to another document?
Message-ID: <YsXDP3r59jlOTXGb@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


I've tried several variants of this without success.  What's the
correct incantation?

+++ b/Documentation/core-api/idr.rst
@@ -17,6 +17,8 @@ solution to the problem to avoid everybody inventing their own.  The IDR
 provides the ability to map an ID to a pointer, while the IDA provides
 only ID allocation, and as a result is much more memory-efficient.

+The IDR interface is deprecated; please use the _`XArray` instead.
+
 IDR usage
 =========

+++ b/Documentation/core-api/xarray.rst
@@ -1,4 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0+
+.. XArray_

 ======
 XArray

I first tried "named reference, reStructuredText_;"
and then "_`inline internal target`" and I've tried both prefixing and
suffixing both destination and target with an underscore.  Nothing seems
to work and sometimes I get error messages telling me it won't work,
and sometimes I just get non-hyperlinks.

Do I have to do something like

	:ref:`Documentation/core-api/xarray.rst <XArray>`
?  That would seem unnecessarily verbose.
