Return-Path: <linux-doc+bounces-83956-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEBcJjAY52ll3wEAu9opvQ
	(envelope-from <linux-doc+bounces-83956-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 08:24:48 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94365436E78
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 08:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F984300623B
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 06:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE0F382373;
	Tue, 21 Apr 2026 06:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MHRyEvCi"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E334436166E;
	Tue, 21 Apr 2026 06:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776752683; cv=none; b=sc3xiUZAI20Ig09xoaNwijchDkQE5gMtTpthMwd9N9YXcZ3TdbqpwJmxRN0CuzJiOIEWqCL7BhFGz+t4eXCVnVOayclsYdSh24ewsDKE+KrxDUdmExcImMuori225uu3FVJgRIBtO3EdteWMsY8lORjJINaRIfwPtYre0Nz+ch8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776752683; c=relaxed/simple;
	bh=H5LXpbWQGHxrc690vZi3I1NXcc8PBNmHG5EXIPileng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m1kIzAqnSiXUikTf8VBiz+xy0LSOpuXviqe75MHx7r16narKDjOrAP617DpgeAW3SnrlSYtuwnwhCA2u/joMba9SRbW6RZTrhX9MiGx7CsXSbPt5iX/n6N5sW8gzZk7hOfYlGDhON2jYs7vkNf82Ez3+wC39qErzurhikbwwVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MHRyEvCi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0CBC2BCB0;
	Tue, 21 Apr 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776752682;
	bh=H5LXpbWQGHxrc690vZi3I1NXcc8PBNmHG5EXIPileng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MHRyEvCiJwOiM47m/JOUhPsVPiZhmNqd+ETjA9Qw5OPdUkdDHCmw92AqHPh6sVVF3
	 skFxtyEIAAxmVfdtDdH8DdiEscuhBCpLtoW+oCzZ+gNqC2psYokVRq9vjgP8DTxg3L
	 p4z9Wofbd2qbz+6HF5COqPIDFa/Hb9XL0F70A+iM=
Date: Tue, 21 Apr 2026 08:24:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] driver core: platform: set mod_name in driver
 registration
Message-ID: <2026042156-bloated-lushness-c28a@gregkh>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-acpi_mod_name-v2-2-e73f9310dad3@sony.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83956-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_CC(0.00)[vrfy.org,kernel.org,arm.com,linaro.org,linux.intel.com,gmail.com,foss.st.com,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,linuxfoundation.org,sony.com,vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sony.com:email]
X-Rspamd-Queue-Id: 94365436E78
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 03:02:35PM +0900, Shashank Balaji wrote:
> Pass KBUILD_MODNAME through the driver registration macro so that
> the driver core can create the module symlink in sysfs for built-in
> drivers, and fixup all callers.
> 
> The Rust platform adapter is updated to pass the module name through to the new
> parameter.
> 
> Tested on qemu with:
> - x86 defconfig + CONFIG_RUST
> - arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT
> 
> Examples after this patch:
> 
>     /sys/bus/platform/drivers/...
>         coresight-itnoc/module		-> coresight_tnoc
>         coresight-static-tpdm/module	-> coresight_tpdm
>         coresight-catu-platform/module	-> coresight_catu
>         serial8250/module		-> 8250
>         acpi-ged/module			-> acpi
>         vmclock/module			-> ptp_vmclock
> 
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> Depends on the previous patch, without which the kernel fails to boot on arm64
> defconfig.
> ---
>  Documentation/driver-api/driver-model/platform.rst |  3 ++-
>  drivers/base/platform.c                            | 21 ++++++++++++++-------
>  drivers/hwtracing/coresight/coresight-catu.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
>  drivers/hwtracing/coresight/coresight-cpu-debug.c  |  2 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     |  2 +-
>  drivers/hwtracing/coresight/coresight-replicator.c |  2 +-
>  drivers/hwtracing/coresight/coresight-stm.c        |  3 ++-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   |  3 ++-
>  drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
>  drivers/hwtracing/coresight/coresight-tpdm.c       |  2 +-
>  drivers/hwtracing/coresight/coresight-tpiu.c       |  3 ++-
>  include/linux/coresight.h                          |  3 ++-
>  include/linux/platform_device.h                    | 17 +++++++++--------
>  rust/kernel/platform.rs                            |  4 +++-
>  15 files changed, 47 insertions(+), 29 deletions(-)

That's a lot of different things all in one change, please break this up
into smaller bits, this is not going to work.

Especially as the coresight changes are incorrect, no individual module
should EVER have to list THIS_MODULE or KBUILD_MODNAME in a function, it
should happen automatically by the compiler using a helper #define, like
is done for other busses.

Please fix that up first, then you can worry about the other ones.

thanks,

greg k-h

