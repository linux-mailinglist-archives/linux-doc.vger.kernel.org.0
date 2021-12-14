Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF1D47397B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Dec 2021 01:22:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242994AbhLNAWc (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 13 Dec 2021 19:22:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242184AbhLNAWb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Dec 2021 19:22:31 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C6AEC061574
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 16:22:31 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id b187so21133980iof.11
        for <linux-doc@vger.kernel.org>; Mon, 13 Dec 2021 16:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xdDuB1YG6XTXDhWwkGkmln0E+/N5BEU+BrEQQgdpPmY=;
        b=gwhbkJpHH5rTNp0Z6uxU5d66XAXmNYxGmy0drFgtfDh+geMk3+7EMaZf7sCjgI/5dp
         WUIYDPOrkylCGZ0bu9Bmvw9tzrpkcO2HpVPhI6E+WKqfjWQhw05snOM3fHY6lwHZrPoM
         oVsLRQuiea1Cw8ul/DTzFiVBFASI9arLmfmM5b28xIih0qSGDPqEHxI6tViuxe7/Fk17
         Hd++hOSc1UsKmzQsFdOjfiu458/cgzOqhBOURC2RSjG1my9MG077fkZAmEVWI7bpDeMZ
         Pwt8rSyuBUNWIAc0M4jGSRXGHzos9DXq+C1Vni+0z8ZOGAnnzrhS8c+Wtv001oejjzJX
         BSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xdDuB1YG6XTXDhWwkGkmln0E+/N5BEU+BrEQQgdpPmY=;
        b=3l2J+mx1xfjHMW0bnnnxaWad6DZG0rNLIUEFuBz4knIz6XpHxMAqDQ87xdOjvrBBq5
         O3moFqf+PunE8zI+VR7MKDa0IXEGQwmUD9flOand9ek29xtBV+vHgLpa0R9rtK34fQy1
         bJOfsYd/01jr+gf9fbWWZJq2Cvi9i0ain2PH0IiWBrjSOVifdB5dDx/pw0oAZqcrc0hw
         b7lME+Yra7jj9UId0ufZh2uz0AU6BDEYREteMELOKwyz8ffi3upaizvik4g56EiHLgOK
         41lztRbPANLAaPxZKG5FjvA2CdVl8dHQCcJ0YzPSfXnI56Iofrv49UBprIhOZANh8bjX
         eBIQ==
X-Gm-Message-State: AOAM533ClTR2m+Gh0ey1BCUVYRJm0aFAS/Qj1Odr2wy+zB0dZRuwPdgK
        qxUc0J0GC1rrdeT68mOsCknuUKTqpdmQ0KQ3ywgX6g==
X-Google-Smtp-Source: ABdhPJyCHKaf9UKVoATEck3LTMSSftVTZ/0PQGYg+50WAy0eM15osVpyM19KBCZdRXcUqPPpyYL26Oca5akvBsAqT/w=
X-Received: by 2002:a6b:ea0a:: with SMTP id m10mr1382455ioc.91.1639441350311;
 Mon, 13 Dec 2021 16:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20211123000102.4052105-1-almasrymina@google.com> <YaMBGQGNLqPd6D6f@casper.infradead.org>
In-Reply-To: <YaMBGQGNLqPd6D6f@casper.infradead.org>
From:   Mina Almasry <almasrymina@google.com>
Date:   Mon, 13 Dec 2021 16:22:19 -0800
Message-ID: <CAHS8izM5as_AmN4bSmZd1P7aSXZ86VAfXgyooZivyf7-E5gZcQ@mail.gmail.com>
Subject: Re: [PATCH v7] mm: Add PM_THP_MAPPED to /proc/pid/pagemap
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>,
        "Paul E . McKenney" <paulmckrcu@fb.com>,
        Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Peter Xu <peterx@redhat.com>,
        Ivan Teterevkov <ivan.teterevkov@nutanix.com>,
        Florian Schmidt <florian.schmidt@nutanix.com>,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Nov 27, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Nov 22, 2021 at 04:01:02PM -0800, Mina Almasry wrote:
> > Add PM_THP_MAPPED MAPPING to allow userspace to detect whether a given virt
> > address is currently mapped by a transparent huge page or not.  Example
> > use case is a process requesting THPs from the kernel (via a huge tmpfs
> > mount for example), for a performance critical region of memory.  The
> > userspace may want to query whether the kernel is actually backing this
> > memory by hugepages or not.
>
> But what is userspace going to _do_ differently if the kernel hasn't
> backed the memory with huge pages?

Sorry for the late reply here.

My plan is to expose this information as metrics right now and:
1. Understand the kind of hugepage backing we're actually getting if any.
2. If there are drops in hugepage backing we can investigate the
cause, whether it's due to normal memory fragmentation or some
bug/issue.
3. Schedule machines for reboots to defragment the memory if the
hugepage backing is too low.
4. Possibly motivate future work to improve hugepage backing if our
numbers are too low.
