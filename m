Return-Path: <linux-doc+bounces-87011-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BGFIQHJAmrQwgEAu9opvQ
	(envelope-from <linux-doc+bounces-87011-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:30:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D9251B0A7
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 08:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 944B030AD7EB
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 06:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA714478E5A;
	Tue, 12 May 2026 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv9WhdFQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADD743E4AC;
	Tue, 12 May 2026 06:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778566811; cv=none; b=RXtPjXOEzNRUwRwF4K2aZcT78h/gSgiY00ROyEHXFo4H5QFbNH5WszCF4dmK4hpZDOEqSKlKozH7yv7AjHh7NYsc+lixm8FAwl0znnUaU2GUlTYm2xAt1rLWKrr4irPV2pVEPZpLKpCJGAVHsaTeJoJqKIDKjZ/NlC0tDjdUHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778566811; c=relaxed/simple;
	bh=mdePbjeNsfhn1GjWkUJByHSc9WmgU55uX6g5q5krJDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pUoqAm/tbqrndgrq3Ovcm/Phi8MjJtnaZhX7NLcZ0O+Xtb+UfOQE9IVBEuJAnY93snhE99qnK8bPWx0NyI8BKXbxVzWYWQIA17DBPXXNHZLf7awBd/zhBUlNM3effuDE4uPADjqeyFaKx3aVW5uftGccYKz+/bZYDla+D6Lkf68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv9WhdFQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7631C2BCB0;
	Tue, 12 May 2026 06:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778566809;
	bh=mdePbjeNsfhn1GjWkUJByHSc9WmgU55uX6g5q5krJDw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Iv9WhdFQCVyrp77Mkoz9OM2hiDo0iT2RKeHM5iUPqNvrHjEgusLl4WJ54q5apKQkG
	 MpWPJWW3h0uS8XpPmnQJBPngamllwr36WT/bZpPHbt7xtzoo8PP07Q7ZIasKOP9oaI
	 3Cs49iy0YeY/XtB7NETpaqm1y9s3mjUMH0Fk8Ebk/HZ6WYGu+mJ1as/5oE2t6eeZN9
	 SBEWhh0v6LIQurjqDc1xL4qIEDB9bkQohd3X83f7GZ6Jpeo12KrabryqEW7wUUO/BK
	 kFszctyXhERWNBy4LavKOM3cUsxHDDWENc45PR2OoRYuNdL6hfyqBQfoIR6+HTLdzP
	 ZVqIjYiXckmKQ==
Date: Tue, 12 May 2026 08:20:03 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hardening@vger.kernel.org, peter.griffin@linaro.org,
 andre.draszik@linaro.org, willmcvicker@google.com, jyescas@google.com,
 krzk@kernel.org, kernel-team@android.com
Subject: Re: [PATCH] docs: kernel-doc: python: strip __counted_by_ptr macro
Message-ID: <20260512082003.4b36bdaf@foz.lan>
In-Reply-To: <20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org>
References: <20260506-kdoc-__counted_by_ptr-v1-1-70763486871f@linaro.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F0D9251B0A7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87011-lists,linux-doc=lfdr.de,huawei];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,foz.lan:mid]
X-Rspamd-Action: no action

On Wed, 06 May 2026 11:04:12 +0000
Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> The `__counted_by_ptr` macro was recently introduced [1] to extend
> bounds checking semantics to standard dynamically allocated pointers.
> 
> However, the new Python implementation of kernel-doc does not currently
> recognize it as a compiler attribute. When kernel-doc encounters a
> struct member annotated with this macro, it fails to parse the variable
> name correctly, resulting in false-positive warnings like:
> 
>   Warning: ... struct member '__counted_by_ptr(cmdcnt' not described
> 
> Add `__counted_by_ptr` to the `struct_xforms` regex list so it gets
> safely stripped out during the parsing phase, mirroring the existing
> behavior for `__counted_by`. Update the corresponding unit tests.
> 
> Link: https://git.kernel.org/torvalds/c/150a04d817d8 [1]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  tools/lib/python/kdoc/xforms_lists.py | 1 +
>  tools/unittests/test_cmatch.py        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
> index f6ea9efb11ae..118156ea8cd2 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -29,6 +29,7 @@ class CTransforms:
>          (CMatch("__aligned"), ""),
>          (CMatch("__counted_by"), ""),
>          (CMatch("__counted_by_(le|be)"), ""),
> +        (CMatch("__counted_by_ptr"), ""),
>          (CMatch("__guarded_by"), ""),
>          (CMatch("__pt_guarded_by"), ""),
>          (CMatch("__packed"), ""),
> diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
> index 7b996f83784d..109141cd2ab8 100755
> --- a/tools/unittests/test_cmatch.py
> +++ b/tools/unittests/test_cmatch.py
> @@ -320,6 +320,7 @@ class TestSubWithLocalXforms(TestCaseDiff):
>          (CMatch('__aligned'), ' '),
>          (CMatch('__counted_by'), ' '),
>          (CMatch('__counted_by_(le|be)'), ' '),
> +        (CMatch('__counted_by_ptr'), ' '),
>          (CMatch('__guarded_by'), ' '),
>          (CMatch('__pt_guarded_by'), ' '),
>  
> 
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260506-kdoc-__counted_by_ptr-1e206f3f1dc1
> 
> Best regards,



Thanks,
Mauro

