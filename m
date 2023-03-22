Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBA956C59A9
	for <lists+linux-doc@lfdr.de>; Wed, 22 Mar 2023 23:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjCVW60 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 22 Mar 2023 18:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCVW6X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Mar 2023 18:58:23 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FC1305F1
        for <linux-doc@vger.kernel.org>; Wed, 22 Mar 2023 15:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
        bh=zJp4Y5Lw4Qy49NkbNely/ZBAVf09re8By+2d8xkTbJw=; b=KQ7TCKjrvVjJTlr8bpGUCV/Uk4
        3puin9ZNHhyPNBGlMFm+RYuRsVLKgjfLVOcntd3CAWisQmGlr3MH9A/sPaAyDaPcit4evoKJFfyZ/
        oTKRJpoylUdhAvs1zDk74PLC4Ju3jR/e/vjCmgWtIkm4rbcXhUPHtuItMGl/Q1gn/iq6+AnVYUvDU
        P84djWehACF+nHdFsd8H6kIlMsqHDJxpgRTWl8r3Ja4R50JKHX6PPrsFv//bazTXvgWdZFIdy5OQz
        HT+N3WOhemd6NyhmmDD7hZBDQrwvz9rFJ8i5yxlJ5y1xmAr+5YmdL2jMNPzQZCLjruii4wnypOfzz
        F8chSG3A==;
Received: from [2601:1c2:980:9ec0::21b4]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1pf7PS-0003bB-16;
        Wed, 22 Mar 2023 22:58:22 +0000
Message-ID: <369843bb-3a7a-78d0-40ac-0df51b0cc58d@infradead.org>
Date:   Wed, 22 Mar 2023 15:58:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Fwd: Documentation on IMA for Linux Kernel Documentation
Content-Language: en-US
To:     Ken Goldman <kgold@linux.ibm.com>, linux-doc@vger.kernel.org
References: <60ac4c41-65b8-3c3d-7e31-1a580e728ca5@infradead.org>
 <a3289dfb-da44-47ce-9f3b-1f5c9dec900c@linux.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <a3289dfb-da44-47ce-9f3b-1f5c9dec900c@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 3/22/23 15:04, Ken Goldman wrote:
> I'm writing documentation on IMA targeting users (not kernel developers).  It includes concepts, details on writing policies, the IMA event log format, utilities, and more.  It aggregates existing scattered documentation, but adds much more.  It's maybe 1/2 done.
> 
> Questions:
> 
> 1. Are there people who could look at it and see if I'm on the right path?
> 
> It's a lot of work.  I'd like to know that it has some chance of acceptance.

Review in terms of IMA-specific content?  or in terms of ReST usage?
or in general terms to see if it is appropriate for kernel tree documentation?

I think that you should Cc: linux-integrity@vger.kernel.org for their input
as well as linux-doc@vger.kernel.org. Several of us here can look at it for
general review feedback.

> 2. What is the process for getting a block of documentation added to https://www.kernel.org/doc/html?

From last week's email:

>>> It should be added to the kernel tree in the Documentation/userspace-api/ subdirectory
>>> or Documentation/security/ subdirectory.  The kernel.org/doc/ web pages are generated
>>> from what is in the Linux kernel tree.

although if you don't think that it is appropriate for either of those subdirectories,
just explain and justify that and it might be possible to put it somewhere else.

-- 
~Randy
