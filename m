Return-Path: <linux-doc+bounces-42823-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1EDA844CD
	for <lists+linux-doc@lfdr.de>; Thu, 10 Apr 2025 15:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E480E18858F6
	for <lists+linux-doc@lfdr.de>; Thu, 10 Apr 2025 13:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C117F28A404;
	Thu, 10 Apr 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUVN7kZ2"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9754F2857DA;
	Thu, 10 Apr 2025 13:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291634; cv=none; b=RNuo68t09BhLlzFQquMIdgfG7S+sIkOCqYRf7gAPmge4ZUo0p6zON7COyAqJlUxG71JNWFHc7qjSz2+r4JJzMetja7opGj6yho1ZyP7Um5ydx6JpkHBGfEXS41Pm26vbAz9pVMQXt4D+DRE7/hvNtKr9ZnxPgsRPocICS7T6riA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291634; c=relaxed/simple;
	bh=uJNt4QupPmB5L6K4f/LhHjqr0GkS2EqrPb2R93LqjUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo8Ke950UpezlDxet8lVK8o4hRJ/1gQ74+q6YttOwpZywpgxrqcwUtYX6O8FjAMt8C0Qs8My5RqLcGIExvNR/dams3tQC7Nkd4E7jhWx6y6Lnt+vCoqypkQTdhJlylA6Nj5ImBFPJtWV/LJCrXQkqzBKU/IxgC2WZSPbAlduxMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUVN7kZ2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CBD8C4CEE8;
	Thu, 10 Apr 2025 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744291634;
	bh=uJNt4QupPmB5L6K4f/LhHjqr0GkS2EqrPb2R93LqjUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PUVN7kZ2Fp/FqfPqkbfWtE/lYMV3vJzYKXcBEzQdd4Si6dFhD8w0kUy9vnDtP+J1h
	 mgfXKHawgVbFbUmGImkPo2AbKFiyAxDgnU9oicMqt99ev1eUk4EhkQqRe5/QJ3YhCg
	 rezqbqC/LnQ1bj79R6LAHBg8W5OKYmxKeBzXMkEcXS+PHWPYIkGyl/ukyGbD4KK7Za
	 xzHjr9XSH0Sy6QuSVLeqPszgKihI8h///9GmK7IrzkkrMQn9EWyxp005B5dxT9ae6g
	 Nkr1sjNNfJdSwode/OtBqP1Ul9qR0MmsKrhzxMMlOhwKyUuV5nCOleJy4bxdVZWlO8
	 zJRGh8PwnLRTg==
Date: Thu, 10 Apr 2025 16:27:06 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: intel-wired-lan@lists.osuosl.org,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Tatyana Nikolova <tatyana.e.nikolova@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Lee Trager <lee@trager.us>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Sridhar Samudrala <sridhar.samudrala@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Ahmed Zaki <ahmed.zaki@intel.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Karlsson, Magnus" <magnus.karlsson@intel.com>,
	Emil Tantilov <emil.s.tantilov@intel.com>,
	Madhu Chittim <madhu.chittim@intel.com>,
	Josh Hay <joshua.a.hay@intel.com>,
	Milena Olech <milena.olech@intel.com>, pavan.kumar.linga@intel.com,
	"Singhai, Anjali" <anjali.singhai@intel.com>,
	Phani R Burra <phani.r.burra@intel.com>
Subject: Re: [PATCH iwl-next 05/14] libeth: add control queue support
Message-ID: <20250410132706.GR199604@unreal>
References: <20250408124816.11584-1-larysa.zaremba@intel.com>
 <20250408124816.11584-6-larysa.zaremba@intel.com>
 <20250410082137.GO199604@unreal>
 <Z_ehEXmlEBREQWQM@soc-5CG4396X81.clients.intel.com>
 <20250410112349.GP199604@unreal>
 <Z_fAdLJ4quuP2lip@soc-5CG4396X81.clients.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_fAdLJ4quuP2lip@soc-5CG4396X81.clients.intel.com>

On Thu, Apr 10, 2025 at 02:58:28PM +0200, Larysa Zaremba wrote:
> On Thu, Apr 10, 2025 at 02:23:49PM +0300, Leon Romanovsky wrote:
> > On Thu, Apr 10, 2025 at 12:44:33PM +0200, Larysa Zaremba wrote:
> > > On Thu, Apr 10, 2025 at 11:21:37AM +0300, Leon Romanovsky wrote:
> > > > On Tue, Apr 08, 2025 at 02:47:51PM +0200, Larysa Zaremba wrote:
> > > > > From: Phani R Burra <phani.r.burra@intel.com>
> > > > > 
> > > > > Libeth will now support control queue setup and configuration APIs.
> > > > > These are mainly used for mailbox communication between drivers and
> > > > > control plane.
> > > > > 
> > > > > Make use of the page pool support for managing controlq buffers.
> > > > 
> > > > <...>
> > > > 
> > > > >  libeth-y			:= rx.o
> > > > >  
> > > > > +obj-$(CONFIG_LIBETH_CP)		+= libeth_cp.o
> > > > > +
> > > > > +libeth_cp-y			:= controlq.o
> > > > 
> > > > So why did you create separate module for it?
> > > > Now you have pci -> libeth -> libeth_cp -> ixd, with the potential races between ixd and libeth, am I right?
> > > >
> > > 
> > > I am not sure what kind of races do you mean, all libeth modules themselves are 
> > > stateless and will stay this way [0], all used data is owned by drivers.
> > 
> > Somehow such separation doesn't truly work. There are multiple syzkaller
> > reports per-cycle where module A tries to access module C, which already
> > doesn't exist because it was proxied through module B.
> 
> Are there similar reports for libeth and libie modules when iavf is enabled?

To get such report, syzkaller should run on physical iavf, it looks like it doesn't.
Did I miss it here?
https://syzkaller.appspot.com/upstream/s/net

> It is basically the same hierarchy. (iavf uses both libeth and libie, libie 
> depends on libeth).
> 
> I am just trying to understand, is this a regular situation or did I just mess 
> smth up?

My review comment was general one. It is almost impossible to review
this newly proposed architecture split for correctness.

> 
> > 
> > > 
> > > As for the module separation, I think there is no harm in keeping it modular. 
> > 
> > Syzkaller reports disagree with you. 
> >
> 
> Could you please share them?

It is not an easy question to answer, because all these reports are complaining
about some wrong locking order or NULL-pointer access. You will never know if
it is because of programming or design error.

As an approximate example, see commits a27c6f46dcec ("RDMA/bnxt_re: Fix an issue in bnxt_re_async_notifier")
and f0df225d12fc ("RDMA/bnxt_re: Add sanity checks on rdev validity").
At the first glance, they look unrelated to our discussion, however
they can serve as an example or races between deinit/disable paths in
parent module vs. child.

>  
> > > We intend to use basic libeth (libeth_rx) in drivers that for sure have no use 
> > > for libeth_cp. libeth_pci and libeth_cp separation is more arbitral, as we have 
> > > no plans for now to use them separately.
> > 
> > So let's not over-engineer it.
> > 
> > > 
> > > Module dependencies are as follows:
> > > 
> > > libeth_rx and libeth_pci do not depend on other modules.
> > > libeth_cp depends on both libeth_rx and libeth_pci.
> > > idpf directly uses libeth_pci, libeth_rx and libeth_cp.
> > > ixd directly uses libeth_cp and libeth_pci.
> > 
> 
> I need to amend this: libeth_cp does not depend on libeth_pci in terms of 
> module namespace, it only uses the header to access struct device that is 
> stored in libeth_pci-specific mmio_info.

So why did you add SELECT in kconfig?

> 
> > You can do whatever module architecture for netdev devices, but if you
> > plan to expose it to RDMA devices, I will vote against any deep layered
> > module architecture for the drivers.
> > 
> > BTW, please add some Intel prefix to the modules names, they shouldn't
> > be called in generic names like libeth, e.t.c
> >
> 
> We did not think this would be a problem, intel has a tradition of calling the 
> modules pretty ambiguously.

I know and it is worth to be changed.

> 
> > Thanks
> > 
> > > 
> > > [0] https://lore.kernel.org/netdev/61bfa880-6a88-4eac-bab7-040bf72a11ef@intel.com/
> > > 
> > > > Thanks
> 

