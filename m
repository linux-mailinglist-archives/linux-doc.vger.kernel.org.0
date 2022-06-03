Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3A3753CB76
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jun 2022 16:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240024AbiFCOVa (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 3 Jun 2022 10:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiFCOV3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Jun 2022 10:21:29 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095D04C404
        for <linux-doc@vger.kernel.org>; Fri,  3 Jun 2022 07:21:27 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3DE7D37C;
        Fri,  3 Jun 2022 14:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3DE7D37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654266087; bh=FOLsQBw3O3nOcISv8naNPyLYV7JWHHchcHVjP809Slo=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=bP7UDaJhsC4oVIMYTbr1FX7svd27RdvwbYLLvFiL3tsr3K2rouDbBPK2xGLyYrGet
         XyXBRxbYg6Y9ulZlPycKzeNs1FQ5Kjdnb071bkDmr5vuvcJIjXbYuO3Cx0QqfWlJdE
         9e1dNfrJyOMLEOeyBIUFQBBzDkGwl6OF4A6azGtvAFUCCg+FKguNVt332gH14cVVKb
         KQQiUFbYyqumynwAYStfZzhiXWzinqs0Ni2epHfPvyAoklzgjJ2p1yG3K/rqN9j73V
         +aVH1husa8IIFRVhVZHF+Y5EQXRbqsyjhhIPryMM7+0Dky8BwBOt43A0mwq883UsQv
         oirTuUfrZXiNg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
In-Reply-To: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Date:   Fri, 03 Jun 2022 08:21:39 -0600
Message-ID: <877d5xx1xo.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Adam Turner <aaturnerpython@outlook.com> writes:

> Hi,
>
> I was pointed in the direction of this mailing list by Jani Nikula in
> [1]_, who said:
>
>> Thanks for the ping. I was heavily involved in the early days of
>> converting the kernel to use Sphinx, but I haven't closely followed
>> the recent developments. Basically I think I'd also be inclined to
>> push for much higher minimum Sphinx version requirements than what
>> the kernel currently has. The minimum at the moment is v1.7.9 
>> (or v2.4.4 for PDF). It's difficult to maintain support for a wide
>> range of Sphinx versions. Perhaps the best bet would be to mail the
>> kernel documentation list at linux-doc@vger.kernel.org and Cc 
>> Jonathan Corbet corbet@lwn.net to try to reach an understanding on
>> the recommended minimum version and version ranges that makes sense
>> for both parties to support. HTH.
>
> This email is an attempt to do that. 
>
> From Sphinx's perspective, we'd like to remove long-deprecated code.
> What is a good solution here for both sides? The intertial option is
> for us to delay the deprecation by another major version (removal is
> currently scheduled for Sphinx 6 (2023-05), and we are currently 
> releasing a major version every May.
>
> Jani reports that you still require Sphinx 1.7.9 -- I have no 
> investment in the documentation development of the kernel, but he
> rightly notes that is quite an old version -- released 3 years and 9
> months ago.
>
> Please would you let me know if there is anything required on our
> (Sphinx's) end that would let us drop the "pre v3" support gracefully.

We've been meaning to raise the minimum version for a bit.  Going to v3
might be a bit of a stretch, though.  I still do most of my test builds
with 2.4.3 just because Sphinx got so....much........slower with 3.0.
I've not yet had a chance to try out 5.0 to see if that helps things,
that's on my list to do soon.

Thanks,

jon
