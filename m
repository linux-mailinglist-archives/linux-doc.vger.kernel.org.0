Return-Path: <linux-doc+bounces-48734-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B629AD5813
	for <lists+linux-doc@lfdr.de>; Wed, 11 Jun 2025 16:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFBD1E1389
	for <lists+linux-doc@lfdr.de>; Wed, 11 Jun 2025 14:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2021280A5B;
	Wed, 11 Jun 2025 14:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Odn9UwMv"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A78328B7FC
	for <linux-doc@vger.kernel.org>; Wed, 11 Jun 2025 14:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749650950; cv=none; b=Zt3q3QydwXiFEWer9z3PnT+Ors9vdvLOx2gQHWbFFc9fzfXl6sefo/PNiBosqkoC/r9pLNk2KtHNywcYWl+fj1//GKpM5+e38oU1oLYrRDv2zOtmDHtcsF1YKkgYl2nFf4eCTKpf8q48uefYhfPqktsFpr3D5j3oy06PR5u9Y2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749650950; c=relaxed/simple;
	bh=4dqNwAQYmy0EGh2tN9SAQfO1hbjPMfrvLNgwoYO1F+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXsgj64kp8N7WqL85V8TWnvOcrHm8YSbNm3jFoMSSBXLVPzpIiK91BY/V7Insr06AztVI1hF3R6fI8NA5jCfWi9WnidYJZZd/13y6eEGgA4xEblGPoCmnDhRRyGu6y5/C15WvmuXxCuTTuGs0+1xXvUIs1l/nSrYUjDv9OoDqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Odn9UwMv; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 11 Jun 2025 16:09:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749650945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cKUNapIic7qcB73602nGRDfvP380aXrb6L7bSN67WMc=;
	b=Odn9UwMvxjKy/QQm+4jej/I3CNptvQ3o060oWmenfpkhbV/QGd7dk84HzyM3XF6VsjI+V5
	MsNXgE6jzkLmgABa+TWcBWwuz0Q6myVpuB6QFUymOBZYiOLNOVuKXvIvgxaqlclbiHSwSo
	C0TZQfzUuQkfMQT2/WnZmpS0J3HpN+Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH v3 04/16] kbuild: userprogs: add nolibc support
Message-ID: <20250611-horned-prudent-saluki-b5a5df@l-nschier-aarch64>
References: <20250611-kunit-kselftests-v3-0-55e3d148cbc6@linutronix.de>
 <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-kunit-kselftests-v3-4-55e3d148cbc6@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Wed, Jun 11, 2025 at 09:38:10AM +0200, Thomas Weißschuh wrote:
> Userprogs are built with the regular kernel compiler $CC.
> A kernel compiler does not necessarily contain a libc which is required
> for a normal userspace application.
> However the kernel tree does contain a minimal libc implementation
> "nolibc" which can be used to build userspace applications.
> 
> Introduce support to build userprogs against nolibc instead of the
> default libc of the compiler, which may not exist.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> ---
> This could probably be moved out of the generic kbuild makefiles.
> I think the ergonimics would suffer and this functionality could be
> used by other users of userprogs.
> 
> Also this does currently not support out-of-tree builds.
> For that tools/include/nolibc/*.h and usr/include/*.h would need to be
> installed into the build directory.

Thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>

Probably overkill, but might it make sense to abort *-nolibc compilation 
requests for out-of-tree builds?

Kind regards,
Nicolas

