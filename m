Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 822DD195A42
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2020 16:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgC0Pt1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 27 Mar 2020 11:49:27 -0400
Received: from mx.sdf.org ([205.166.94.20]:53882 "EHLO mx.sdf.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726959AbgC0Pt0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Mar 2020 11:49:26 -0400
Received: from sdf.org (IDENT:lkml@sdf.lonestar.org [205.166.94.16])
        by mx.sdf.org (8.15.2/8.14.5) with ESMTPS id 02RFnMBV014590
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits) verified NO);
        Fri, 27 Mar 2020 15:49:23 GMT
Received: (from lkml@localhost)
        by sdf.org (8.15.2/8.12.8/Submit) id 02RFnMtX006769;
        Fri, 27 Mar 2020 15:49:22 GMT
Date:   Fri, 27 Mar 2020 15:49:22 +0000
From:   George Spelvin <lkml@SDF.ORG>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, lkml@sdf.org
Subject: Tweak MAINTAINERS text to match get_maintainer.pl?
Message-ID: <20200327154922.GB19653@SDF.ORG>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I rcently submitted a patch to the WILC1000 staging driver. I erred by 
only sending it to the people listed for that driver in the MAINTAINERS 
file, and missed gregkh and the devel@driverdev.osuosl.org list.

Now, get_maintainer.pl does output those addresses, as they cover all of 
drivers/staging/, but I was misled by the text in MAINTAINERS "When 
reading this list, please look for the most precise areas first."

I took that to mean that the specific superseded the general, but
apparently I'm supposed to take the union.

Except that I'm pretty sure Linus is meant to be a fallback, not
Cc:ed on every driver patch.

So I'm confused about what the actual rules are.  But if they're encoded 
in check_maintainer.pl, could the text in MAINTAINERS be updated to match? 
Thank you.
