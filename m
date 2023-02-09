Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2FB690EF3
	for <lists+linux-doc@lfdr.de>; Thu,  9 Feb 2023 18:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjBIRN1 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 9 Feb 2023 12:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjBIRNZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Feb 2023 12:13:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CA8663FF;
        Thu,  9 Feb 2023 09:13:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 78DCA61B48;
        Thu,  9 Feb 2023 17:13:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56871C4339C;
        Thu,  9 Feb 2023 17:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675962794;
        bh=Qjd7CG1wm6qgm0UE2g5ksTjdM6XEnqb6bxTuuiklLAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pO7GP6zDrkCIhEnNLY7niim5SelXeyowbFVpOUV0w5Lr07vJ1g5v3axBbIk4Z7NSf
         Rgkpr3oiJ8vYsgj2GQlYYGE0KUW71EZ/jwfJDa2Bqf1NB2zNQDZklRiDHNoTWOLKgO
         BLp3EdWvbjLhQmjcP82ujneAdzsu+VQCjxQZAsE8=
Date:   Thu, 9 Feb 2023 18:13:12 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Evan Green <evan@rivosinc.com>
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
        heiko@sntech.de, slewis@rivosinc.com,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Atish Patra <atishp@rivosinc.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Dao Lu <daolu@rivosinc.com>, Guo Ren <guoren@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruizhe Pan <c141028@gmail.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Tobias Klauser <tklauser@distanz.ch>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
Message-ID: <Y+UpqHstcMahbadE@kroah.com>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-3-evan@rivosinc.com>
 <Y+HsE397cY4HF+5K@kroah.com>
 <C3C21677-5250-4120-9A4F-24945C1EE51B@kernel.org>
 <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALs-HsvuX-Uj5g9c6vvUp=MaUpdcPdpwwQCsxzjoXpqS+3LEsA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 09, 2023 at 09:09:16AM -0800, Evan Green wrote:
> On Mon, Feb 6, 2023 at 10:32 PM Conor Dooley <conor@kernel.org> wrote:
> >
> > Hey Evan, Greg,
> >
> >
> > On 7 February 2023 06:13:39 GMT, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >On Mon, Feb 06, 2023 at 12:14:51PM -0800, Evan Green wrote:
> > >> We don't have enough space for these all in ELF_HWCAP{,2} and there's no
> > >> system call that quite does this, so let's just provide an arch-specific
> > >> one to probe for hardware capabilities.  This currently just provides
> > >> m{arch,imp,vendor}id, but with the key-value pairs we can pass more in
> > >> the future.
> > >
> > >Ick, this is exactly what sysfs is designed to export in a sane way.
> > >Why not just use that instead?  The "key" would be the filename, and the
> > >value the value read from the filename.  If the key is not present, the
> > >file is not present and it's obvious what is happening, no fancy parsing
> > >and ABI issues at all.
> >
> > https://lore.kernel.org/linux-riscv/20221201160614.xpomlqq2fzpzfmcm@kamzik/
> >
> > This is the sysfs interface that I mentioned drew
> > suggested on the v1.
> > I think it fits ~perfectly with what Greg is suggesting too.
> 
> Whoops, I'll admit I missed that comment when I reviewed the feedback
> from v1. I spent some time thinking about sysfs. The problem is this
> interface will be needed in places like very early program startup. If
> we're trying to use this in places like the ifunc selector to decide
> which memcpy to use, having to go open and read a fistful of files is
> going to be complex that early, and rough on performance.

How is it going to be any different on "performance" than a syscall?  Or
complex?  It should be almost identical overall as this is all in-ram
and not any real I/o is happening.  You are limited only by the speed of
your cpu.

> Really this is data that would go great in the aux vector, except
> there's probably too much of it to justify preparing and copying into
> every new process. You could point the aux vector into a vDSO data
> area. This has the advantage of great performance and no syscall, but
> has the disadvantages of making that data ABI, and requiring it all to
> be known up front (eg the kernel can't compute any answers on the
> fly).
> 
> After discussions with Palmer, my plan for the next version is to move
> this into a vDSO function plus a syscall. Private vDSO data will be
> prepped with common answers for the "all CPUs" case, avoiding the need
> for a syscall in most cases and making this fast. Since the data is
> hidden behind the vdso function, it's not ABI, which is a plus. Then
> the vdso function can fall back to the syscall for cases with exotic
> CPU masks or keys that are unknown/expensive to compute at runtime.

I still think that's wrong, as you are wanting a set of key/values here,
which is exactly what sysfs is designed for.

Please benchmark this first.  Heck, if you don't like the
open/read/close syscall overhead, use my readfile() syscall patch that I
keep proposing every 6 months or so to remove that overhead.  That would
be a good reason to get that code accepted finally :)

thanks,

greg k-h
