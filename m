Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2638651F33A
	for <lists+linux-doc@lfdr.de>; Mon,  9 May 2022 06:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiEIENC (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 9 May 2022 00:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbiEIEJV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 00:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CB4B57FF64
        for <linux-doc@vger.kernel.org>; Sun,  8 May 2022 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652069128;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FKpZ+Ah3zelx5R9OuHUazNjKjbfFkmtgJjzbVYW/aR4=;
        b=D3fyzCpmfK5ohkKflzs1SvbEl4wThaV0M9PB5kuYfxCD9zHJF+5Nj7FCf8yrlzL4N8gvMn
        O5C91wS6l3FUmUVnlgvlJy4f9sLru837fI/mJiJSdW3Ti5wOhr1lK4vAt6jzvu0l6G9XP2
        bT1WOmVKjpHhhRXke8nc/PGS2RiIIvg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-DKEPQ_o2MQWLJ-6UYvp_0A-1; Mon, 09 May 2022 00:05:25 -0400
X-MC-Unique: DKEPQ_o2MQWLJ-6UYvp_0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0C52185A794;
        Mon,  9 May 2022 04:05:24 +0000 (UTC)
Received: from localhost (ovpn-13-212.pek2.redhat.com [10.72.13.212])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B78CB40D1B9A;
        Mon,  9 May 2022 04:05:23 +0000 (UTC)
Date:   Mon, 9 May 2022 12:05:21 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Eric Biederman <ebiederm@xmission.com>,
        kexec@lists.infradead.org, Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        Feng Zhou <zhoufeng.zf@bytedance.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Chen Zhou <dingguo.cz@antgroup.com>,
        John Donnelly <John.p.donnelly@oracle.com>,
        Dave Kleikamp <dave.kleikamp@oracle.com>
Subject: Re: [PATCH v24 6/6] docs: kdump: Update the crashkernel description
 for arm64
Message-ID: <YniTAbNIfaLKhFWK@MiWiFi-R3L-srv>
References: <20220506114402.365-1-thunder.leizhen@huawei.com>
 <20220506114402.365-7-thunder.leizhen@huawei.com>
 <20220506231451.GB122876@MiWiFi-R3L-srv>
 <6e662eae-e788-13d3-368a-e88ed159fc85@huawei.com>
 <YnXn87JnfUxI2lC2@MiWiFi-R3L-srv>
 <Yna5AVli1IIUd2kg@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yna5AVli1IIUd2kg@arm.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/07/22 at 07:22pm, Catalin Marinas wrote:
> On Sat, May 07, 2022 at 11:30:59AM +0800, Baoquan He wrote:
> > On 05/07/22 at 09:41am, Leizhen (ThunderTown) wrote:
> > > On 2022/5/7 7:14, Baoquan He wrote:
> > > > On 05/06/22 at 07:44pm, Zhen Lei wrote:
> > > >> Now arm64 has added support for "crashkernel=X,high" and
> > > >> "crashkernel=Y,low". Unlike x86, crash low memory is not allocated if
> > > >> "crashkernel=Y,low" is not specified.
> > > >>
> > > >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> > > >> ---
> > > >>  Documentation/admin-guide/kernel-parameters.txt | 9 +++++++--
> > > >>  1 file changed, 7 insertions(+), 2 deletions(-)
> > > >>
> > > >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > >> index 3f1cc5e317ed4a5..aa44c61114aa4b8 100644
> > > >> --- a/Documentation/admin-guide/kernel-parameters.txt
> > > >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > >> @@ -808,7 +808,7 @@
> > > >>  			Documentation/admin-guide/kdump/kdump.rst for an example.
> > > >>  
> > > >>  	crashkernel=size[KMG],high
> > > >> -			[KNL, X86-64] range could be above 4G. Allow kernel
> > > >> +			[KNL, X86-64, ARM64] range could be above 4G. Allow kernel
> > > >>  			to allocate physical memory region from top, so could
> > > >>  			be above 4G if system have more than 4G ram installed.
> > > >>  			Otherwise memory region will be allocated below 4G, if
> > > >> @@ -821,7 +821,7 @@
> > > >>  			that require some amount of low memory, e.g. swiotlb
> > > >>  			requires at least 64M+32K low memory, also enough extra
> > > >>  			low memory is needed to make sure DMA buffers for 32-bit
> > > >> -			devices won't run out. Kernel would try to allocate at
> > > >> +			devices won't run out. Kernel would try to allocate
> > > >>  			at least 256M below 4G automatically.
> > > >>  			This one let user to specify own low range under 4G
> > > >>  			for second kernel instead.
> > > >> @@ -829,6 +829,11 @@
> > > >>  			It will be ignored when crashkernel=X,high is not used
> > > >>  			or memory reserved is below 4G.
> > > >>  
> > > >> +			[KNL, ARM64] range in low memory.
> > > >> +			This one let user to specify a low range in DMA zone for
> > > >                                           ^ not needed,
> > > >                         Maybe Catalin can fix it when merging.
> > > 
> > > Delete "This one let user to" or the entire sentence? I understand it to be the former.
> > 
> > Oh, I mean the 'to' is not needed. "This one let user specify ....". The
> > 'to' is a grammer mistake.
> 
> Slightly more correct is "This one lets the user specify..."
> 
> I can fix them up when applying.

Right, thx.

