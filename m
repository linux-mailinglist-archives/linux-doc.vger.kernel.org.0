Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8520D744BD5
	for <lists+linux-doc@lfdr.de>; Sun,  2 Jul 2023 01:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGAX7U (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 1 Jul 2023 19:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGAX7U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Jul 2023 19:59:20 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE311725;
        Sat,  1 Jul 2023 16:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=PCx2QFqb52a7urpGxQBuPxQ1h1DO4tHuNtmm/dPKApw=; b=KSxhLz9ZjLeJuJ3RMQ43qS02l8
        IVasIAOOE6qONvuqbZVf+ewEUaAn1X8kuatdZtYP0QdgFS4sQgCP6PXBJH0zyziGjK5UNiUOxy4zg
        ZducdnyS4rkgG7HmHy4A6/2Ghc2Lo7MuIlbqr7IkKXhPr6cFnR9bwer3iHqfG6PXbEJmqphiKIKQJ
        6nKI7d1Suvkh7cBEv/5bvDFNCB4dsx+UGKAWgdA06Sn+rv5fDJrpt0qmCxaadzfThlIxtC/BZ+tuA
        leWmdCwjZBEZT+KvkXA/KOIRNI4PpLtjS+bPbX3FUEHSFvvZ8vBjhvMvdIyAu0SCKmGNYMPPF2xjr
        kx5lqpdg==;
Received: from [2601:1c2:980:9ec0::2764]
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qFkUb-006q3K-1C;
        Sat, 01 Jul 2023 23:59:05 +0000
Message-ID: <970a881a-cdaf-2568-657a-3b93b0273338@infradead.org>
Date:   Sat, 1 Jul 2023 16:59:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] Documentation/mm: Add information about
 kmap_local_folio()
Content-Language: en-US
To:     Matthew Wilcox <willy@infradead.org>
Cc:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Deming Wang <wangdeming@inspur.com>,
        Ira Weiny <ira.weiny@intel.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Peter Collingbourne <pcc@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>
References: <20230701142041.9992-1-fmdefrancesco@gmail.com>
 <68a9b3aa-d064-ed6a-2bcd-9423eb4f595c@infradead.org>
 <ZKC8uE9fE57PuL91@casper.infradead.org>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZKC8uE9fE57PuL91@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 7/1/23 16:54, Matthew Wilcox wrote:
> On Sat, Jul 01, 2023 at 08:21:20AM -0700, Randy Dunlap wrote:
>>> -* kmap_local_page().  This function is used to require short term mappings.
>>> -  It can be invoked from any context (including interrupts) but the mappings
>>> -  can only be used in the context which acquired them.
>>> -
>>> -  This function should always be used, whereas kmap_atomic() and kmap() have
>>> +* kmap_local_page(), kmap_local_folio() - These functions are used to require
>>
>>                                                                          acquire ?
> 
> "create" might be better?

Yes, that's good.

>>> +  short term mappings. They can be invoked from any context (including
>>> +  interrupts) but the mappings can only be used in the context which acquired
>>> +  them. The only differences between them consist in the first taking a pointer
>>> +  to a struct page and the second taking a pointer to struct folio and the byte
>>> +  offset within the folio which identifies the page.
>>
>> -- 
>> ~Randy

-- 
~Randy
