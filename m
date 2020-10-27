Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A7329A2CE
	for <lists+linux-doc@lfdr.de>; Tue, 27 Oct 2020 03:55:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408417AbgJ0Cy5 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 26 Oct 2020 22:54:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34536 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408268AbgJ0Cy5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 22:54:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id t14so7208204pgg.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 19:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QZF0W4dH550EVE0uGKIEMc2tMXwcFBBpVdPSQqA2FHM=;
        b=2MAHbHx0ohuPXh5dfEpWBJ1Wo1XpSybr0ZIK4nZml41vCIF1vUACcWxDhu7y1Ip5o3
         m0rAzVo+jdRzscmsBgtSK5F2nx6US1AxlWhQAtnUMWANCNouKFShn7mkLrXt07PIt+29
         Ae5VD9TY9vxoo8dkcC9NTOiEL8Jr88c0iFX8/xL9Pn+lGm23m5Rz1+DzuC8XTfFkVtKJ
         6fUnFqiZ1EIcmk31nj/CL5qhZHrS0vi1keWT7Yy464+gAY9EObA83xx5sJFakBU8kQHf
         18UOHryCI9Z/tLR3iV4lE1PlMYz1Txi+ifXGpBBrSLRLHYt0eNPb+u2WnrovgJpikVhS
         0R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QZF0W4dH550EVE0uGKIEMc2tMXwcFBBpVdPSQqA2FHM=;
        b=J+ThYYUhKZx6pzXijbvP7WAudYwiKXYv5ZlfS1a7NY6o2+tomL0m0SYE78RsIX8Lv8
         SS1XmRsD1sW9fvmDj6qLa/OnQFTlPp1GMyNkMv+eYlZvk14OlzjXrBV0+tdW6useFr8t
         V2OMPYHhF7E5afbcHZhwuLotQm7Fjs8g7B/UI9vTz9MoGAYBV4cu/d0TbPkIMdvorGRq
         ahxNft64Nzu4au21ER2IN/kebfEXE2h95FH4iLMjW2LI5/bDZS9hN4TYWG0AUv01QSz/
         DZhXISJyCqtIyPi+8798qBpTYcrzqlz/JqZvfNP/eGN0b/F33MPDtP4HFUSUSMB03CP+
         4mYA==
X-Gm-Message-State: AOAM5321Jrf5HKiZLmYgpBKCpCPuHShADeworIEuFYhkzIHbSM1AWxZ7
        wFAKmIEaEghQyQD1wP4s2s/fQpI9X6DRtXpeJyn7Pw==
X-Google-Smtp-Source: ABdhPJyUXYA2QbO5JVQ8aPVZ/qUZFKpo5APz2TO+UBNlY/I1gMKpDxJkGfjqKKIr9iRX+x23PthAvtxpgrmzfwJVtsM=
X-Received: by 2002:a63:c851:: with SMTP id l17mr21924pgi.31.1603767295050;
 Mon, 26 Oct 2020 19:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201026145114.59424-1-songmuchun@bytedance.com> <20201026155351.GS20115@casper.infradead.org>
In-Reply-To: <20201026155351.GS20115@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 27 Oct 2020 10:54:18 +0800
Message-ID: <CAMZfGtU4VQ08dnxNBsFfxVEnuOZauOhGSLQpi++3fngc_qNqXQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 00/19] Free some vmemmap pages of
 hugetlb page
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 26, 2020 at 11:53 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Oct 26, 2020 at 10:50:55PM +0800, Muchun Song wrote:
> > For tail pages, the value of compound_dtor is the same. So we can reuse
>
> compound_dtor is only set on the first tail page.  compound_head is
> what you mean here, I think.
>

Yes, that's right.  Sorry for the confusion. Thanks.

-- 
Yours,
Muchun
