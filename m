Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A9027B6F3
	for <lists+linux-doc@lfdr.de>; Mon, 28 Sep 2020 23:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgI1VUE (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 28 Sep 2020 17:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgI1VUC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Sep 2020 17:20:02 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913D6C0613CE
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2020 14:20:02 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F34CB72D;
        Mon, 28 Sep 2020 21:20:00 +0000 (UTC)
Date:   Mon, 28 Sep 2020 15:19:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     NeilBrown <neilb@suse.de>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: seq_file: clarify role of *pos in ->next()
Message-ID: <20200928151958.43d3822d@lwn.net>
In-Reply-To: <87eemqiazh.fsf@notabene.neil.brown.name>
References: <87eemqiazh.fsf@notabene.neil.brown.name>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Sep 2020 17:14:42 +1000
NeilBrown <neilb@suse.de> wrote:

> There are behavioural requirements on the seq_file next() function in
> terms of how it updates *pos at end-of-file, and these are now enforced
> by a warning.
> 
> I was recently attempting to justify the reason this was needed, and
> couldn't remember the details, and didn't find them in the
> documentation.
> 
> So I re-read the code until I understood it again, and updated the
> documentation to match.
> 
> I also enhanced the text about SEQ_START_TOKEN as it seemed potentially
> misleading.
> 
> Cc: Vasily Averin <vvs@virtuozzo.com>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  Documentation/filesystems/seq_file.rst | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)

Applied, thanks.

jon
