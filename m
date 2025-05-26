Return-Path: <linux-doc+bounces-47527-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB29AC4141
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 16:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65041189A854
	for <lists+linux-doc@lfdr.de>; Mon, 26 May 2025 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB9A20B81D;
	Mon, 26 May 2025 14:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IGqh7FC2"
X-Original-To: linux-doc@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A011820CCCC
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748269299; cv=none; b=T8xf4HLcofvRnJ+sZCZ+LCN5kV+ncN/PQi6vViSEUyQfdGhZNewQv1eP89QiiD3fpI8huF2f0Z8LHr0yB1B/ahk7BYC9fmgcP58Jp3xp47Tbi182HOuRP4t07mY6cB6Z+0P/CVk57MGcFeY7uLDHgUBoT8jSMki3rOTrTi1uhh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748269299; c=relaxed/simple;
	bh=uKXhWPOILNcQquoiuD69dBT+Mmz/yWe+XilXIUZIOFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5fah+oXyFBSS94RC8YvUqKA+bRkE2mogwUkV+r3ihD5kGvqeoE+vDa8hHWd3d1vre+v3vWGb/pYiFXCqDdhBBy8fVwYvHpD36oT7YNNWNyWkj/x9iNRWZ0+WglenSSWExLgWNlbAD9unADdjEOeMsfBUCbiMwZvZurBbDQpjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IGqh7FC2; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 26 May 2025 16:21:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748269285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/56synuCCnJoxo5M+YtSLlSsLFpX8j3sUa2PtLr5C/U=;
	b=IGqh7FC2NcAjELjoBFhOeDtIIyeciLw2yEwMU43R7ItqYqYDw5KGQ3ZXLu6rP/nuctszPW
	k2q0WZFsNYFSNEP2edFk42EfD8Euun9yne0oW0Q3KvGEccceZAiQJ7Fuc1d7J6mZuLWu9a
	VRUzWkV9GhHQibbTditkhG2L9dQF8t4=
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 04/11] kbuild: introduce blob framework
Message-ID: <20250523-slim-dancing-mussel-c7a5f1@l-nschier-aarch64>
References: <20250407-kunit-kselftests-v2-0-454114e287fd@linutronix.de>
 <20250407-kunit-kselftests-v2-4-454114e287fd@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-kunit-kselftests-v2-4-454114e287fd@linutronix.de>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Mon, Apr 07, 2025 at 09:42:41AM +0200, Thomas Weißschuh wrote:
> Various subsystems embed non-code build artifacts into the kernel,
> for example the initramfs, /proc/config.gz, vDSO image, etc.
> Currently each user has their own implementation for that.
> 
> Add a common "blob" framework to provide this functionality.
> It provides standard kbuild and C APIs to embed and later access non-code
> build artifacts into the kernel image or modules.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> ---
> Due to its closeness to kbuild this is currently added to its MAINTAINER entry.
> But I can also maintain it on its own.
> ---
>  Documentation/kbuild/makefiles.rst | 23 +++++++++++++++++++++--
>  MAINTAINERS                        |  2 ++
>  include/linux/blob.h               | 32 ++++++++++++++++++++++++++++++++
>  scripts/Makefile.blobs             | 19 +++++++++++++++++++
>  scripts/Makefile.build             |  6 ++++++
>  scripts/Makefile.clean             |  2 +-
>  scripts/blob-wrap.c                | 27 +++++++++++++++++++++++++++
>  7 files changed, 108 insertions(+), 3 deletions(-)

Thanks, looks good to me and I like the design!

Reviewed-by: Nicolas Schier <n.schier@avm.de>

-- 
Nicolas Schier

