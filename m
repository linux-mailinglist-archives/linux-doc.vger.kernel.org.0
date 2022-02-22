Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A079A4BFBF6
	for <lists+linux-doc@lfdr.de>; Tue, 22 Feb 2022 16:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232544AbiBVPKo (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 22 Feb 2022 10:10:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbiBVPKo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Feb 2022 10:10:44 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0261D10EC4D;
        Tue, 22 Feb 2022 07:10:16 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 73CBA4E5;
        Tue, 22 Feb 2022 15:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 73CBA4E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1645542616; bh=ALGH7iOYwCo49flT4WXEOGBzbwlfU/zKPwJ2pGSM98E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=J+nhgGZfv1fqILzXbp+WM+Gbtw9cMzzNGCcblTFQPRCtE6v+pkidZe2I2D55uBOvS
         uVBkQzwtVXg+XCZQyEGsLrrVZKoUsRFfd6KMcuUPxuSXs/+Mxg4K0napKqL97orj+S
         yvSEwqrzruTbgL7zX2VmDCzyYt2cTtnA/CMOX9kpzmRld2Iguh26jQo29a2q7swGhc
         qrRF4d01OEwAwj6yVUgCpeU/jLyU0L6BwtuG2nblXHNaW4pjk/8LCdvRjSBAGA80x5
         k6f2mqlWrPhXTB0TPhNhra4R71vJVNTxRlRMTaN0b9x0R8DiqbwaXRrFF3/TLN1+gL
         k7Y/D+GpfszPQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jens Axboe <axboe@kernel.dk>, Naohiro Aota <naohiro.aota@wdc.com>,
        linux-block@vger.kernel.org
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: block/diskstats: update function names
In-Reply-To: <be020330-5b67-ad0d-0214-b89f97f8d3e3@kernel.dk>
References: <20220222012751.1933194-1-naohiro.aota@wdc.com>
 <be020330-5b67-ad0d-0214-b89f97f8d3e3@kernel.dk>
Date:   Tue, 22 Feb 2022 08:10:15 -0700
Message-ID: <87ilt7szs8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jens Axboe <axboe@kernel.dk> writes:

> On 2/21/22 6:27 PM, Naohiro Aota wrote:
>> __make_request() and end_that_request_last() do no longer exist. Replace
>> them with the current call-site.
>
> Reviwed-by: Jens Axboe <axboe@kernel.dk>
>
> Jon, will you pick this one up?

Will do.

Thanks,

jon
