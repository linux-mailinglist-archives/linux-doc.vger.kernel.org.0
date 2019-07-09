Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B28D62D41
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jul 2019 03:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfGIBCd (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 8 Jul 2019 21:02:33 -0400
Received: from edison.jonmasters.org ([173.255.233.168]:59278 "EHLO
        edison.jonmasters.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfGIBCb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Jul 2019 21:02:31 -0400
Received: from boston.jonmasters.org ([50.195.43.97] helo=tonnant.bos.jonmasters.org)
        by edison.jonmasters.org with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.71)
        (envelope-from <jcm@jonmasters.org>)
        id 1hkdxB-0003Xo-BL; Tue, 09 Jul 2019 00:25:53 +0000
To:     "qi.fuli@fujitsu.com" <qi.fuli@fujitsu.com>,
        Will Deacon <will@kernel.org>
Cc:     Will Deacon <will.deacon@arm.com>,
        "indou.takao@fujitsu.com" <indou.takao@fujitsu.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20190617143255.10462-1-indou.takao@jp.fujitsu.com>
 <20190617170328.GJ30800@fuggles.cambridge.arm.com>
 <e8fe8faa-72ef-8185-1a9d-dc1bbe0ae15d@jp.fujitsu.com>
 <20190627102724.vif6zh6zfqktpmjx@willie-the-truck>
 <5999ed84-72d0-9d42-bf7d-b8d56eaa4d4a@jp.fujitsu.com>
From:   Jon Masters <jcm@jonmasters.org>
Message-ID: <675313fe-007b-c850-d730-a629b82ccfc8@jonmasters.org>
Date:   Mon, 8 Jul 2019 20:25:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5999ed84-72d0-9d42-bf7d-b8d56eaa4d4a@jp.fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 50.195.43.97
X-SA-Exim-Mail-From: jcm@jonmasters.org
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
        edison.jonmasters.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham version=3.3.1
Subject: Re: [PATCH 0/2] arm64: Introduce boot parameter to disable TLB flush
 instruction within the same inner shareable domain
X-SA-Exim-Version: 4.2.1 (built Sun, 08 Nov 2009 07:31:22 +0000)
X-SA-Exim-Scanned: Yes (on edison.jonmasters.org)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/2/19 10:45 PM, qi.fuli@fujitsu.com wrote:

> However, we found that with the increase of that the TLB flash was called,
> the noise was also increasing. Here we understood that the cause of this 
> issue is the implementation of Linux's TLB flush for arm64, especially use of 
> TLBI-is instruction which is a broadcast to all processor core on the system. 

Are you saying that for a microbenchmark in which very large numbers of
threads are created and destroyed rapidly there are a large number of
associated tlb range flushes which always use broadcast TLBIs?

If that's the case, and the hardware doesn't do any ASID filtering and
each TLBI results in a DVM to every PE, would it make sense to look at
whether there are ways to improve batching/switch to an IPI approach
rather than relying on broadcasts, as a more generic solution?

Jon.
