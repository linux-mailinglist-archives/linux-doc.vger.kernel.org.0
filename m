Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59D0F4D04DD
	for <lists+linux-doc@lfdr.de>; Mon,  7 Mar 2022 18:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238330AbiCGRFq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 7 Mar 2022 12:05:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240544AbiCGRFp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 12:05:45 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D8CC64BC5
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 09:04:50 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2dc242a79beso161442067b3.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 09:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MFytkXFVm+nQKBfdysr1CcxHAqYCnsg45+4U4K+ObQM=;
        b=4nXPz/240sTZkTNjrrs+YCUsZXJ69EFBHPB4zrzlis4OZy6aLv9xkGR+r5be2fVmfs
         PEFFMQp6c8hnOFOpwKWExugg1BcQ5/SvRKOOFxDtKUKr8y4pVFwIrFFF+rS9E0Ey6T4X
         t5b4BFCCWTqKOtckWBbRvAXOnqFn4jyBu2LXY6HMi0VEgnO7IaaQq1PduZfg6mjOnUGK
         mYXR+KWSp8EEbDu1mkeIaIpCQOzGYzMpYVmjuC2Dyzi8+jKs7p8xWcXzFSQBQ4dZzpKO
         TdB+ORLfdFIQKKlM1tB7rExkxI4EtpLiVN0raeK2SJKuI146TvS43W4PnTQbc3Rpc3Gw
         WeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MFytkXFVm+nQKBfdysr1CcxHAqYCnsg45+4U4K+ObQM=;
        b=ZZxHJLtxfRQUG/dBgeNv51gtY9gjK1IJJF+Ew6iox14jqlMBEm+8+u8tnFGALK1BQl
         94wPdJW/Q+xtjdK+dD/zWFwheR9TEa9kdk3ZjYuLcwaVjY/PLqvtGT3/lEv1oErVlwmQ
         IJefJHGDKYK/1ryMM1i1h+BAzBDbis/B7n1/h6vyWh6zDsXyLZOxfa0KC0EeFVRlAbFL
         r5NAgYSuNaHSyX2GQ/Y+IqPPnamccxGWAZR6atiH/nP9QSQLX7FqTA0lQaGxFuEAh9eX
         FJ6yYNZqKRKijbeWXdVztYvbeRT5VnVMaXdJDSXCCzwgX1uxHcSU6vzu5wECnLaPPBEK
         e5CQ==
X-Gm-Message-State: AOAM5307wOTlKJz8f+aLJexSY9/GC+XQSuB6ULAgVBpOTh0sJULHV5YK
        GYTQ7AlrkUkwDj9XNwIwo/NI+sTgWELJuDPdm1jXLA==
X-Google-Smtp-Source: ABdhPJztR+S2W/s9ItNiWnCahlnxnbCNypLwubklaZAxAS+l5RMXq/fSTQrA9tZ86ojAdf2uRsrxoeq1F/D9AmvN2/0=
X-Received: by 2002:a0d:e609:0:b0:2d6:b8b0:8608 with SMTP id
 p9-20020a0de609000000b002d6b8b08608mr9223373ywe.31.1646672689245; Mon, 07 Mar
 2022 09:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20220307130708.58771-1-songmuchun@bytedance.com>
 <20220307130708.58771-2-songmuchun@bytedance.com> <YiY0QkE+efo1hyda@bombadil.infradead.org>
In-Reply-To: <YiY0QkE+efo1hyda@bombadil.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 8 Mar 2022 01:03:08 +0800
Message-ID: <CAMZfGtWHZgvFSE0P1LNprcjt0YAvC5XFAz=aUZw9vJFPGzUTbw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm: hugetlb: disable freeing vmemmap pages when
 struct page crosses page boundaries
To:     Luis Chamberlain <mcgrof@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Oscar Salvador <osalvador@suse.de>,
        David Hildenbrand <david@redhat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        Muchun Song <smuchun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 8, 2022 at 12:35 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>
> On Mon, Mar 07, 2022 at 09:07:05PM +0800, Muchun Song wrote:
> > If the size of "struct page" is not the power of two and this
> > feature is enabled, then the vmemmap pages of HugeTLB will be
> > corrupted after remapping (panic is about to happen in theory).
>
> Huh what? If a panic is possible best we prevent this in kconfig
> all together. I'd instead just put some work into this instead of
> adding all this run time hacks.

If the size of `struct page` is not power of 2, then those lines added
by this patch will be optimized away by the compiler, therefore there
is going to be no extra overhead to detect this.

>
> Can you try to add kconfig magic to detect if a PAGE_SIZE is PO2?
>

I agree with you that it is better if we can move this check
into Kconfig. I tried this a few months ago. It is not easy to
do this. How to check if a `struct page size` is PO2 in
Kconfig? If you have any thoughts please let me know.

Thanks.
