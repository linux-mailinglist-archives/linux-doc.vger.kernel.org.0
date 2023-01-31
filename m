Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A38B682FF5
	for <lists+linux-doc@lfdr.de>; Tue, 31 Jan 2023 15:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232308AbjAaO63 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 31 Jan 2023 09:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbjAaO6N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 09:58:13 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630E615CBF;
        Tue, 31 Jan 2023 06:57:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12174B81D38;
        Tue, 31 Jan 2023 14:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DC5DC433EF;
        Tue, 31 Jan 2023 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675177075;
        bh=xY2imQ/4jVR/SklTLINW5s0+AQ0x+kTf64hP7eo+Tr8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MGzBcSja4/aGrarJgv1xthxH7End6L0Qnnwl/ijNXHO0BisZ5Hqky3HnCbSyzg0J6
         v8aiv7RBj0ZqY0J0nJWLa25dYiwrFE37Qwd6pzAXD6TosrVbRWF/g1E43Rjw5q4z2A
         /POxDnFPwBqPzGDWYnKjVO1rXl9qLytS4K5jJruZYbxjhZmzHbSnt/vdXmzoFiLbtV
         QexrbM6E0J8vQ90kMP201to2etgN+7EvuUlTkEtXwIg2lViiN5lFyJtcnOalIrVeKG
         hiNekdsJcEbhKTSxE4ay8sc67L3uz1AneUMP8As+XOsVqMARwlwL4l7SJne1Chq+qF
         P+sKcrln0cYOw==
Date:   Tue, 31 Jan 2023 15:57:51 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] Docs/input/index: Add missing SPDX License
 Identifier
Message-ID: <20230131155751.4dcb0885@coco.lan>
In-Reply-To: <20230122213650.187710-6-sj@kernel.org>
References: <20230122213650.187710-1-sj@kernel.org>
        <20230122213650.187710-6-sj@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Sun, 22 Jan 2023 21:36:47 +0000
SeongJae Park <sj@kernel.org> escreveu:

> Add missing SPDX License Identifier for input documentation index file.
> 
> Signed-off-by: SeongJae Park <sj@kernel.org>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  Documentation/input/index.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/input/index.rst b/Documentation/input/index.rst
> index 35581cd18e91..d60bf9cfe005 100644
> --- a/Documentation/input/index.rst
> +++ b/Documentation/input/index.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  ===================
>  Input Documentation
>  ===================



Thanks,
Mauro
