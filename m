Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657636F5B79
	for <lists+linux-doc@lfdr.de>; Wed,  3 May 2023 17:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjECPte (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 3 May 2023 11:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjECPtc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 May 2023 11:49:32 -0400
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0D8210E5;
        Wed,  3 May 2023 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1683128971;
        bh=aZHv4qLewpPoN2a7Dp1hmQ518n6knm526HL7tro2+QQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=RuzgPwW7Excw6pez9bbQH1LgK0+PrOgDucE8mX352a/WgEFXdVcyXswKLkwHVN4FK
         NRRB6IArfDLzoJ2Y5xkv3PNA1E6ef4irPxZ/JjdOQrfSM2D4MyBH3rpgG/WnwCUFYL
         KRr071rSZhNhJKS7IDpjG6MPN5NNicYHXLH+D7mM=
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 18E6D1281F1E;
        Wed,  3 May 2023 11:49:31 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id GaG0-VEABDNr; Wed,  3 May 2023 11:49:30 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1683128970;
        bh=aZHv4qLewpPoN2a7Dp1hmQ518n6knm526HL7tro2+QQ=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=q0tL2VdkMVextXF7i8wLij4wc+Rv8eXjweyKXiHti73zJxCRaSCu25jteEhbnxI6v
         yK9rK8oceeU4P+nNqywZMzxEdAYo1SWnGfe4NiTdtA5ocsYJMypoTDNv+p+Qwjz8wz
         oLVM+AAJEgGOGX5BoVd44tXyBl3Vu996X/awzutg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 5B7F812805C5;
        Wed,  3 May 2023 11:49:25 -0400 (EDT)
Message-ID: <d01388d01b93071ac9ad04452ff4ff29d85e90f1.camel@HansenPartnership.com>
Subject: Re: [PATCH 00/40] Memory allocation profiling
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Kent Overstreet <kent.overstreet@linux.dev>
Cc:     Petr =?UTF-8?Q?Tesa=C5=99=C3=ADk?= <petr@tesarici.cz>,
        Michal Hocko <mhocko@suse.com>,
        Suren Baghdasaryan <surenb@google.com>,
        akpm@linux-foundation.org, vbabka@suse.cz, hannes@cmpxchg.org,
        roman.gushchin@linux.dev, mgorman@suse.de, dave@stgolabs.net,
        willy@infradead.org, liam.howlett@oracle.com, corbet@lwn.net,
        void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com,
        ldufour@linux.ibm.com, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
        david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
        masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
        tj@kernel.org, muchun.song@linux.dev, rppt@kernel.org,
        paulmck@kernel.org, pasha.tatashin@soleen.com,
        yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com,
        hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org,
        ndesaulniers@google.com, gregkh@linuxfoundation.org,
        ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
        penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
        glider@google.com, elver@google.com, dvyukov@google.com,
        shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com,
        rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
        kernel-team@android.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-mm@kvack.org, linux-modules@vger.kernel.org,
        kasan-dev@googlegroups.com, cgroups@vger.kernel.org
Date:   Wed, 03 May 2023 11:49:23 -0400
In-Reply-To: <ZFJ9hlQ3ZIU1XYCY@moria.home.lan>
References: <20230501165450.15352-1-surenb@google.com>
         <ZFIMaflxeHS3uR/A@dhcp22.suse.cz> <ZFIOfb6/jHwLqg6M@moria.home.lan>
         <ZFISlX+mSx4QJDK6@dhcp22.suse.cz>
         <20230503115051.30b8a97f@meshulam.tesarici.cz>
         <ZFIv+30UH7+ySCZr@moria.home.lan>
         <25a1ea786712df5111d7d1db42490624ac63651e.camel@HansenPartnership.com>
         <ZFJ9hlQ3ZIU1XYCY@moria.home.lan>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2023-05-03 at 11:28 -0400, Kent Overstreet wrote:
> On Wed, May 03, 2023 at 08:33:48AM -0400, James Bottomley wrote:
> > On Wed, 2023-05-03 at 05:57 -0400, Kent Overstreet wrote:
> > > On Wed, May 03, 2023 at 11:50:51AM +0200, Petr Tesařík wrote:
> > > > If anyone ever wants to use this code tagging framework for
> > > > something else, they will also have to convert relevant
> > > > functions to macros, slowly changing the kernel to a minefield
> > > > where local identifiers, struct, union and enum tags, field
> > > > names and labels must avoid name conflict with a tagged
> > > > function. For now, I have to remember that alloc_pages is
> > > > forbidden, but the list may grow.
> > > 
> > > Also, since you're not actually a kernel contributor yet...
> > 
> > You have an amazing talent for being wrong.  But even if you were
> > actually right about this, it would be an ad hominem personal
> > attack on a new contributor which crosses the line into
> > unacceptable behaviour on the list and runs counter to our code of
> > conduct.
> 
> ...Err, what? That was intended _in no way_ as a personal attack.

Your reply went on to say "If you're going to comment, please do the
necessary work to make sure you're saying something that makes sense."
That is a personal attack belittling the person involved and holding
them up for general contempt on the mailing list.  This is exactly how
we should *not* treat newcomers.

> If I was mistaken I do apologize, but lately I've run across quite a
> lot of people offering review feedback to patches I post that turn
> out to have 0 or 10 patches in the kernel, and - to be blunt - a
> pattern of offering feedback in strong language with a presumption of
> experience that takes a lot to respond to adequately on a technical
> basis.

A synopsis of the feedback is that using macros to attach trace tags
pollutes the global function namespace of the kernel.  That's a valid
observation and merits a technical not a personal response.

James

