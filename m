Return-Path: <linux-doc+bounces-73295-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNleLnXRb2mgMQAAu9opvQ
	(envelope-from <linux-doc+bounces-73295-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:03:17 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A4949F6F
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 20:03:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AB225826810
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 16:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D59477E37;
	Tue, 20 Jan 2026 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dV47J2SI"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D80132F751;
	Tue, 20 Jan 2026 16:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925647; cv=none; b=pNOhNW71pJiQkVG/9UKQ/91r3MiWt2DMkNiLmm2mrlQ1WSvEkvp6JY8s2+/ixJeuokMtvF6tlzKv0ZS4aEpxzJ+bY87M9LIXCXjdVn3n+Dph6MYc18pC8zz6OTSZfMBWsfaLUfGPx9ATmOpR0/pq4yfcP8bFO3eX7qLKxFZ9N8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925647; c=relaxed/simple;
	bh=C1IvwOEB2IeBsljjj1U5exHtGWqVJB2lEhayoPqkk5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BaOFEINDwjO+q8kfPaeP3iRxwubByR906hbIJMQIQ707+jjB9DKov0d0n6DmCMTMLvI2QY6G3iUMdIRMq4/miA4si5QG4aWProFkG+qaDK7IenOe0YFsO5kthuSi+sdl2rOI0L9QGjI7qmzY/U7Bxlc894if9+/cAdVQJk3O8DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dV47J2SI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF835C16AAE;
	Tue, 20 Jan 2026 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925644;
	bh=C1IvwOEB2IeBsljjj1U5exHtGWqVJB2lEhayoPqkk5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dV47J2SIEbcMdZkZ9Lifr8FksIvm38/wEBwH1gTlZgjkovIsgQnrHeducibOmFi2u
	 0MXW3RUHb176VYbMK+JyeNcRLKwK0htuCP642Do6W9esCNrZRZeWgKmjratMzZhxJr
	 /Y/U7vCLf/7KDZtCnyqsm9dTVBjlTW7u7n4Y36QbguNVCx+fcoocx9lfyB/wYY22GI
	 YQxLDv4C46PPgDTux/jLnKScOureFjXjQ3T6yun1zCpFJ4Tb4SkyPicZP67prLnJsO
	 81We6TisKb/KfU/+uDFPsfyFCg9wnY9yaM5CIJw6/dHdUdK9aIvJTFBmcf7RmuOPU6
	 LE8IcaGoozNaQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 4/6] kho: Introduce KHO FDT ABI header
In-Reply-To: <20260105165839.285270-5-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:37 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-5-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:14:01 +0000
Message-ID: <2vxz3440dzxy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-73295-lists,linux-doc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 55A4949F6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: Jason Miu <jasonmiu@google.com>
>
> Introduce the `include/linux/kho/abi/kexec_handover.h` header file,
> which defines the stable ABI for the KHO mechanism. This header specifies
> how preserved data is passed between kernels using an FDT.
>
> The ABI contract includes the FDT structure, node properties, and the
> "kho-v1" compatible string. By centralizing these definitions, this
> header serves as the foundational agreement for inter-kernel
> communication of preserved states, ensuring forward compatibility and
> preventing misinterpretation of data across kexec transitions.
>
> Since the ABI definitions are now centralized in the header files, the
> YAML files that previously described the FDT interfaces are
> redundant. These redundant files have therefore been removed.
>
> Signed-off-by: Jason Miu <jasonmiu@google.com>
> Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

