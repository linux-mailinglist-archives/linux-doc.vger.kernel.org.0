Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D20B4D78DA
	for <lists+linux-doc@lfdr.de>; Mon, 14 Mar 2022 01:02:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbiCNADO (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sun, 13 Mar 2022 20:03:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231932AbiCNADO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Mar 2022 20:03:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDF50C57
        for <linux-doc@vger.kernel.org>; Sun, 13 Mar 2022 17:02:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC1F860DCC
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 00:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF49C340E8;
        Mon, 14 Mar 2022 00:01:45 +0000 (UTC)
Date:   Sun, 13 Mar 2022 20:01:43 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Roland Hieber <rhi@pengutronix.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] docs: trace: bring headings in order
Message-ID: <20220313200143.3328cb87@rorschach.local.home>
In-Reply-To: <20220313105557.172732-2-rhi@pengutronix.de>
References: <20220313105557.172732-1-rhi@pengutronix.de>
        <20220313105557.172732-2-rhi@pengutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 13 Mar 2022 11:55:56 +0100
Roland Hieber <rhi@pengutronix.de> wrote:

>  
> -2.2 Inter-event hist triggers
> ------------------------------
> +Inter-event hist triggers
> +-------------------------
>  
>  Inter-event hist triggers are hist triggers that combine values from
>  one or more other events and create a histogram using that data.  Data
> @@ -1676,8 +1676,8 @@ pseudo-file.
>  
>  These features are described in more detail in the following sections.
>  
> -2.2.1 Histogram Variables
> --------------------------
> +Histogram Variables
> +-------------------
>  

Histogram Variables is a sub section of Inter-event hist triggers,
which this now removes. This affects the output a breaks the intention
of the document. I haven't looked at all the other updates, I just
stopped when I saw this.

-- Steve
