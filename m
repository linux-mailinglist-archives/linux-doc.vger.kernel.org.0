Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F56E747976
	for <lists+linux-doc@lfdr.de>; Tue,  4 Jul 2023 23:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230255AbjGDVQh (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 4 Jul 2023 17:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGDVQg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jul 2023 17:16:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FBDC10CF
        for <linux-doc@vger.kernel.org>; Tue,  4 Jul 2023 14:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688505354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Y8bJxR2hg9jZOo9xJJwily7Z9DBcJ34R5Ty+xrrHVZo=;
        b=cq1sTclzrKy5GRRZ6BowhtHGn2GJSmXuR003H402e6szEhHzB8GOxTfXWEu0/45G2ZgGwP
        bsc9eNiS2MsGn7aNaxIXHd6NUuqLaLJxnbmBGxdPCunMFqMirUAxiKA240UjBGZ9/VXb8q
        FLnsBhx48NpdZy2Ep9jhGpKszoPvr3E=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-PNK3zHm5MkWybenTXwt8LA-1; Tue, 04 Jul 2023 17:15:53 -0400
X-MC-Unique: PNK3zHm5MkWybenTXwt8LA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-62dd79f63e0so13514936d6.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jul 2023 14:15:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688505352; x=1691097352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8bJxR2hg9jZOo9xJJwily7Z9DBcJ34R5Ty+xrrHVZo=;
        b=Wyu0ZzQKvfMJlFoHJc5cHDNtegBGl/V4hJpXLAz+qA7FBkJf06Q2Z5bWxdsWj5tLVF
         WJU1hWXYkqNmihW5mrJkHB51JqLMohxro3Aopo1iXb3xJj+H2fBdzFTnucxlMo0b2VOI
         Yt/xHWR/GSVHwoXZ7+DuVBBhXqm8oPrrmT8lRNOr7lztp3za9DKF5z/HqvaWrPB4NcYd
         3t4GwRW/g560YpLRLxmJVQ9zHjUwnFVxULvFtladPVptRTrsaMEXJ8/Dng5cZdKi3lxc
         0Tkz4SP5RxtOVJRcr87cO5TJxtAsLML40wsqV1Gu9SyJOeyS3tN3Orcmffaf2OkyhT8Q
         ST6A==
X-Gm-Message-State: ABy/qLYZkuatLEaBpXTvwfq8Hb7XEx3DKHrFKHCwYzvlYJsWSwf8yO21
        aBFcWC9nbE5SjShsOGoKPfm/hPariYYpE8LmNj9vL0T1McT5QcaFq05D7GICWrmcGl53gM03mBK
        n5/28SELW7PoUv3VTe53W
X-Received: by 2002:a05:6214:2685:b0:635:d9d0:cccf with SMTP id gm5-20020a056214268500b00635d9d0cccfmr15299205qvb.4.1688505352760;
        Tue, 04 Jul 2023 14:15:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGplsPlE6k/Ac9I4olk/6Quorme09kXiBKYGVccc9DwPZ/ze9ZJey/GJMFKHSw2A+5sGFeDSQ==
X-Received: by 2002:a05:6214:2685:b0:635:d9d0:cccf with SMTP id gm5-20020a056214268500b00635d9d0cccfmr15299183qvb.4.1688505352469;
        Tue, 04 Jul 2023 14:15:52 -0700 (PDT)
Received: from x1n (cpe5c7695f3aee0-cm5c7695f3aede.cpe.net.cable.rogers.com. [99.254.144.39])
        by smtp.gmail.com with ESMTPSA id px11-20020a056214050b00b006238f82cde4sm12696617qvb.108.2023.07.04.14.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 14:15:52 -0700 (PDT)
Date:   Tue, 4 Jul 2023 17:15:50 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Axel Rasmussen <axelrasmussen@google.com>
Cc:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Shuah Khan <shuah@kernel.org>,
        ZhangPeng <zhangpeng362@huawei.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 5/6] selftests/mm: add uffd unit test for UFFDIO_POISON
Message-ID: <ZKSMBnLkGXhlcwWs@x1n>
References: <20230629205040.665834-1-axelrasmussen@google.com>
 <20230629205040.665834-5-axelrasmussen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230629205040.665834-5-axelrasmussen@google.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 29, 2023 at 01:50:39PM -0700, Axel Rasmussen wrote:
> The test is pretty basic, and exercises UFFDIO_POISON straightforwardly.
> We register a region with userfaultfd, in missing fault mode. For each
> fault, we either UFFDIO_COPY a zeroed page (odd pages) or UFFDIO_POISON
> (even pages). We do this mix to test "something like a real use case",
> where guest memory would be some mix of poisoned and non-poisoned pages.
> 
> We read each page in the region, and assert that the odd pages are
> zeroed as expected, and the even pages yield a SIGBUS as expected.
> 
> Why UFFDIO_COPY instead of UFFDIO_ZEROPAGE? Because hugetlb doesn't
> support UFFDIO_ZEROPAGE, and we don't want to have special case code.
> 
> Signed-off-by: Axel Rasmussen <axelrasmussen@google.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

