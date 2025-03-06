Return-Path: <linux-doc+bounces-40070-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD4A54465
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 09:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B622E3B0F7E
	for <lists+linux-doc@lfdr.de>; Thu,  6 Mar 2025 08:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F251FC0F7;
	Thu,  6 Mar 2025 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ZU6l3dcK"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737E1F63F0
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741248829; cv=none; b=QGYrmCXupub9sWutD008GT2h44vN7uKtYvwkG0FobUyh2DAMcEKW8V9IDENQQcRVrsRpeZusQ0wJcM8Wlh5y5KpfwmFR2kpesdVoZpNQF7dXoPHz9UuThgyZDRUn04sGYzSWUAO1KS9w4yy9pUp0dhQGS8hmwgLb4vlCfJcznlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741248829; c=relaxed/simple;
	bh=RmZfOZv9mSU7muKmuICqF7kMncNlxjNLjpCX8r/rE20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4sylRV2Wo59W6Q2P3qxAcTwob1rbeHApyRp2MLHqiDhUiKQ136NvVj3fhmF+pqjuZyzMtsJPGUwkzG9uS7vmCKGPitLQZffUUO55i7b+piW5uhOrVGnLu4q8Cp0vh7o9om9FZn1YTIkZXnzVotN8PT2orcsY6L00bHTXF4/IEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ZU6l3dcK; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43690d4605dso1858005e9.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 00:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741248825; x=1741853625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gLj5XWg7CIE0WfrqZc/tm6IHxyhmUxBPEQxl5xJpjbY=;
        b=ZU6l3dcKui5HpnluuvhRRRr6ihSgUF+VqdR0xI0uWtKO63tVKVIP2EozrAMrYmJw7l
         ugb1AHDTobNPgsPSC3x/sJE5euc+MjbK4GH8NPq8BubRCcDhLr/GvodttT4tbNSncbz8
         iVamZgHbBS6yBpKk+cv0CMpOUA1QZLZ5OHrahrstxITZyCEtSnPvILnH4V6OsxPY1CVH
         T+K8ButUBRnuxpovbVeHcWLxuLJZ8lcbE51jHDm3qxsOdJTnxOjOxaCBzHrIQRwFWm4u
         cViGZqp/5Ieu3WbcpzYxmbUPuDoAxU4E51aIy/ACNR+Y16pUXoBKQegB0icyLdijUJMX
         4TNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741248825; x=1741853625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLj5XWg7CIE0WfrqZc/tm6IHxyhmUxBPEQxl5xJpjbY=;
        b=Rjxsef7APkYv1pCrJPxoIHIkTEOcra+AdcKhDazo8C5XKr+OAXjZnWAPE434EQB6Xe
         WRg/ik2kOIHMCjDGZ7WmE7SFypu8nsKYzupeiXe/TlVje4SOC4z5NrBRXk+uo2SqnOd2
         a1mvGWb/pWQs5JaGkwQ6Vh74pnPonfsO6Q00Nkli2VHnOZNog9XDZfw1Tx5WkMdObOCR
         Om1KGKmf9E/ApIJ8G3aoIqgorTLsp1m92bMU+3Vz3cFvE0yDgmKoozbTcV+YXqZNKUtl
         0hfYT9b49vwxtR58Ivzmhbq/k7PkIsEsfLdLbXQjLyuZvxnMHump1Wnmkh+4xAMP7WED
         sXOw==
X-Forwarded-Encrypted: i=1; AJvYcCV4gv8KFxO9t1REyBpJOkBDqbrt8TsP7Zt5dF+v3kRY1f6BgfafU/cm8AqaTM5IyQwD8rSEfmWkxmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD/8B4aVTE3oWv0YTgjyl6fLpuVk6P0CgU4DUzDosf8w8piEZ9
	u5zjBwMK5Z2TI0knwqIJoTJvwprdgIjvD/xNoyS4yM1MDB7sPIPskhfq24X51Wo=
X-Gm-Gg: ASbGncscCr77DImLMIBnRx1a37YrefSj3DYXxVsgGElTIhrqVDzDSWD5VN310+bqnyc
	Qi4cEC1951AQuBDXsL3cJoP3s1T4L3P3lfDQv9ONW7BvvwvwqloJXSsILMhYtjM0lr/fxx1pFwv
	qN0KDBaisvTtSCoYMtHpFICFh6pFGhx1JH5m90mJrF+QHo4y1lrZ4GcQ74hRprj2T0v7TNzH64l
	wCBx/IARc+J4WMPaBuAYtpqPLkMb/5INul7qP0uq/HhutsjIlDA0D2EVd97yYGJ0RcsTvq13lVO
	RjxuG2RlIOBjNpHyShzN4I4X1K8UXtFT+4L9Ftbm3psfr9CTGce4fmZ7FOq8yQv1Y9ctLVzMKQ=
	=
X-Google-Smtp-Source: AGHT+IEizEhonB9j6mrELEVT2fWpqMYrBXgXdwXsHsJznxRDUYEH+hFr9DD372KDSR8Qo+hFwnpfNA==
X-Received: by 2002:a05:600c:198f:b0:43b:c309:da40 with SMTP id 5b1f17b1804b1-43bd294de7dmr48473505e9.4.1741248825382;
        Thu, 06 Mar 2025 00:13:45 -0800 (PST)
Received: from localhost (cst2-173-28.cust.vodafone.cz. [31.30.173.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c019557sm1262734f8f.50.2025.03.06.00.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 00:13:44 -0800 (PST)
Date: Thu, 6 Mar 2025 09:13:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	cleger@rivosinc.com, alex@ghiti.fr, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 0/8] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250306-3f25ee3d4686442bd215a0fa@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <Z8jU2i5d3e4Dv4vk@ghost>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8jU2i5d3e4Dv4vk@ghost>

On Wed, Mar 05, 2025 at 02:48:58PM -0800, Charlie Jenkins wrote:
> On Tue, Mar 04, 2025 at 01:00:15PM +0100, Andrew Jones wrote:
> > The first six patches of this series are fixes and cleanups of the
> > unaligned access speed probing code. The next patch introduces a
> > kernel command line option that allows the probing to be skipped.
> > This command line option is a different approach than Jesse's [1].
> > [1] takes a cpu-list for a particular speed, supporting heterogeneous
> > platforms. With this approach, the kernel command line should only
> > be used for homogeneous platforms. [1] also only allowed 'fast' and
> > 'slow' to be selected. This parameter also supports 'unsupported',
> > which could be useful for testing code paths gated on that. The final
> > patch adds the documentation.
> 
> Why constrain the command line option to homogeneous platforms?

Based on feedback at the last Plumber's, we've decided not to go out of
our way to support heterogeneous platforms unless they start to
materialize. With that in mind, and the fact that heterogeneous platforms
can use the probing mechanism instead of the command line, then I didn't
think the cpu-list support was worth it yet. Also, we can introduce
support for an optional [,<cpu-list>] attribute later, since the
definition of the parameters would stay the same for when the cpu-list
attribute is absent. Indeed, even if I was to introduce the cpu-list
support now, I would make it optional with the absence of it behaving
as this patch series implements.

Thanks,
drew


> 
> - Charlie
> 
> > 
> > (I'd be happy to split the fixes from the new skip support if we want to
> > discuss the skip support independently, but I want to base on the fixes
> > and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
> > or not at the moment, so I'm just posting together for now in order to
> > be able to check for my patchwork green lights!)
> > 
> > [1] https://lore.kernel.org/linux-riscv/20240805173816.3722002-1-jesse@rivosinc.com/
> > 
> > Thanks,
> > drew
> > 
> > ---
> > v3:
> >  - Fix compile when RISCV_PROBE_UNALIGNED_ACCESS is not selected
> > 
> > v2:
> >  - Change to command line option from table
> > 
> > 
> > Andrew Jones (8):
> >   riscv: Annotate unaligned access init functions
> >   riscv: Fix riscv_online_cpu_vec
> >   riscv: Fix check_unaligned_access_all_cpus
> >   riscv: Change check_unaligned_access_speed_all_cpus to void
> >   riscv: Fix set up of cpu hotplug callbacks
> >   riscv: Fix set up of vector cpu hotplug callback
> >   riscv: Add parameter for skipping access speed tests
> >   Documentation/kernel-parameters: Add riscv unaligned speed parameters
> > 
> >  .../admin-guide/kernel-parameters.txt         |  16 ++
> >  arch/riscv/include/asm/cpufeature.h           |   4 +-
> >  arch/riscv/kernel/traps_misaligned.c          |  14 +-
> >  arch/riscv/kernel/unaligned_access_speed.c    | 237 +++++++++++-------
> >  4 files changed, 168 insertions(+), 103 deletions(-)
> > 
> > -- 
> > 2.48.1
> > 

