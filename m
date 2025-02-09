Return-Path: <linux-doc+bounces-37489-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC645A2DED4
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 16:36:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92EE43A4849
	for <lists+linux-doc@lfdr.de>; Sun,  9 Feb 2025 15:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03B3199223;
	Sun,  9 Feb 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3u3/Kcr"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF6D54738;
	Sun,  9 Feb 2025 15:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739115377; cv=none; b=Y1fwTFTk8a4P8sDiYQJkRsv28VgFssQaiz/cUE07Yh7Waeo7hUC8GCA2NFEhXyfHcoM5XKph/hCQ21J2QFdQEzBOe5j835wPx97RcRrEvS2mKCT+nTymId88ihGSrIIfrGOPneR4scKo45QrvOo0UYnGTeF2fS2TOHD8XchaU7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739115377; c=relaxed/simple;
	bh=FvCj1o+rQVPjPQfvnsYB6OfB+ebTUMelN1NPIRKfUm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgEa+iGURVODxydCesBkaygRSwUuci0MaR7LLA+dt/gFxJVo/C4WBrmKVhIqzya7ntD+4cYKkh6fhVECgnL/fNnAy2+0ClrwnAykeBlgC3EhqYLTQ9sXHwKO67Eg2D+Krtsk0PACt3mWBPmg9V4gn+PEYeapSVe1QZKk1Uq0wao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3u3/Kcr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C26C4CEDD;
	Sun,  9 Feb 2025 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739115377;
	bh=FvCj1o+rQVPjPQfvnsYB6OfB+ebTUMelN1NPIRKfUm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3u3/KcrtcmIGEy9zQ+pS9GBhOCxOuldNX/8M+/psbsFCAR6k6mkrkQQ9tHoeTmBW
	 xLRk+P6+mfsLvmCdpHCspa8cMK571tlYmUywNj0C///BrtXiScEwUtwJqwgMRtgPGe
	 /fACA1T6a3bgLvo8RzV6fTpMtCrC4+a5nxWpNfit5mQqO8OZ8D8hGMsSlSBURAHAoL
	 Tq7Tl0+9E0NWrnDXegjJrCXYT1hCc9oTKdsmaSTmsC2PJVZoUYVCcpPAL2fViXzuRO
	 H9FSMexfRK8U5aKZS1k3PTUD2jNEx4FxC+ogFT7NbPWRUBAOSxTZTbY6PH6vaxJXtE
	 VQcJyxihv9GgA==
Date: Sun, 9 Feb 2025 16:36:08 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: "airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"ajanulgu@redhat.com" <ajanulgu@redhat.com>,
	"lyude@redhat.com" <lyude@redhat.com>,
	"pstanner@redhat.com" <pstanner@redhat.com>,
	Neo Jia <cjia@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>,
	"ojeda@kernel.org" <ojeda@kernel.org>,
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>,
	"gary@garyguo.net" <gary@garyguo.net>,
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
	"benno.lossin@proton.me" <benno.lossin@proton.me>,
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>,
	"aliceryhl@google.com" <aliceryhl@google.com>,
	"tmgross@umich.edu" <tmgross@umich.edu>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6jLaCiiuuE8UPEt@pollux>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
 <Z6ONhNOAtfWsKIRg@cassiopeiae>
 <e02c551e-1ad3-4282-b589-7aaaf2880018@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e02c551e-1ad3-4282-b589-7aaaf2880018@nvidia.com>

On Wed, Feb 05, 2025 at 07:44:19PM +0000, Zhi Wang wrote:
> On 05/02/2025 18.10, Danilo Krummrich wrote:
> > On Wed, Feb 05, 2025 at 03:56:46PM +0200, Zhi Wang wrote:
> >> On Tue,  4 Feb 2025 20:03:12 +0100
> >> Danilo Krummrich <dakr@kernel.org> wrote:
> >>> diff --git a/Documentation/gpu/nova/guidelines.rst b/Documentation/gpu/nova/guidelines.rst
> >>> new file mode 100644
> >>> index 000000000000..28a959f51c2c
> >>> --- /dev/null
> >>> +++ b/Documentation/gpu/nova/guidelines.rst
> >>> @@ -0,0 +1,73 @@
> >>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> >>> +
> >>
> >> I think this will develop into a maintainer handbook in the future which
> >> reflects maintainer's requirements, thoughts, tips...maybe we can make it
> >> explicit? I think it is rules of book that we agree to follow.
> >>
> >> A similar one can be found here.
> >> https://lore.kernel.org/kvm/20230411171651.1067966-1-seanjc@google.com/
> > 
> > Yes, that's the idea. Is there anything additional you'd like to see added for
> > this initial commit?
> >
> 
> I am mostly thinking of testing of vGPU, we can conclude that more 
> clearly when we have basic stuff working. IMO, maybe some brief 
> introduction about maintainer branches, requirements of patch comments, 
> e.g. prefix of patch titles to different components, expectation of the 
> patch comment body beside those already in submitting_patches.rst. I 
> think those would be helpful.

I agree, but I don't think we need those things right from the get-go. Let's add
those things subsequently.

