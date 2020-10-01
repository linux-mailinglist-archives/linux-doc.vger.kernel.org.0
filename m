Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F172809F1
	for <lists+linux-doc@lfdr.de>; Fri,  2 Oct 2020 00:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgJAWU0 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 1 Oct 2020 18:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgJAWU0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 18:20:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88F8AC0613D0
        for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2020 15:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Icbk3hMldVRbsVwix0rLiB8uPfojXf+40SfKBKjrvo4=; b=j/YdW7dqIKSeqhbmYca796dleA
        r9JHwGmvagTMcWTD70XT4Hn1HdM0tWDlhkujv3iJViCtwt87tnA/LWwKscsqhppjLWSpCIcHWneFG
        cTyqmEDcrOWrBUW4oHaxOAAkjftLymdJmhI+MzR2T3Tzt4dr9jFGWPUncx2mJMMTxYVF9n5Q63TE0
        snNlsS5GZ3Rv8zvFOXjQTSLz/JEzmS51SAt0bMZSWEysMOoGeTmTvSYLj3CqNnfNS1IMZm6cgeKgM
        BWyzp9VixFWOOhCKPiJhmqyQ9rmcmSKv5JVKLa6+prQd4wE/SvHN4pZ2lwkm000cBSKnivaawI6tV
        +yTl0T8A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kO6w3-0005Wd-OB; Thu, 01 Oct 2020 22:20:23 +0000
Date:   Thu, 1 Oct 2020 23:20:23 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Sven Roederer <devel-sven@geroedel.de>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: changes.rst: add rsync to the list of required
 tools
Message-ID: <20201001222023.GV20115@casper.infradead.org>
References: <20201001215029.30583-1-devel-sven@geroedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201001215029.30583-1-devel-sven@geroedel.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 01, 2020 at 11:50:29PM +0200, Sven Roederer wrote:
> +rsync is used to instal the kernel-headers system wide with administarative

"install", "administrative" (or just "admin" or even "root"?)

> +permissions. This was added in v5.3.
