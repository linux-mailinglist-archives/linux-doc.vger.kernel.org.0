Return-Path: <linux-doc+bounces-73297-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OP1CMtTLb2mgMQAAu9opvQ
	(envelope-from <linux-doc+bounces-73297-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:39:16 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE049985
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 19:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1C26FA0C441
	for <lists+linux-doc@lfdr.de>; Tue, 20 Jan 2026 16:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3932D31ED61;
	Tue, 20 Jan 2026 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lllm8gJK"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E23431D735;
	Tue, 20 Jan 2026 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926677; cv=none; b=n8EyKTRY/884RlW7XrP7wXHdR8md0j9iD3GxtP6/5/an+WNskhMOuNtURZ8ObSPtQCpDcDSW3b6TLnJ3mBQJcoDkBp/7clBFgfT70L6Y1iN6SwvOy49ksxMXV0WTVR2dujnzbOAcFJNTBbvIJVwM8X7JUiVnbV58HP7+NeM0mcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926677; c=relaxed/simple;
	bh=b+DEzrhzQLEZaXZekFtcaQ+EoJRPMgcm+b7GQK00jzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sxr0woFXb8p/Nta2k9VnH6HpEkLM9aZ+hnBkL7KVLvfF+XKN4TwHvgCVdXcyhlWiQ2aboOqNyQkytJH/6oYCnelDzgkanogHemG1XAaKOe8U34dXfew+ooleHQ4FNfnpTl9KXXt/nX1InGY69vHn+8NIl8Z0lXJpbZbDqYCotpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lllm8gJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E42C16AAE;
	Tue, 20 Jan 2026 16:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768926675;
	bh=b+DEzrhzQLEZaXZekFtcaQ+EoJRPMgcm+b7GQK00jzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lllm8gJKsKXKIIbGa/8Mhv3Frwq887BG2Yh/JTKwz3Cs30xtnoRwE075kz3xMtERX
	 8VbtdWkRd8wwxP5YPBII0c5+/TxFnfnoWO5J0VWK2z1LEJcN+/JVeQpb3DHWY6LEET
	 OzS+5sAmZKniDDSXOJKC5RHqITIbB9bFf6b9yt5/FRwBrGabs4g0INX0mMVFG/gkfr
	 FFDWmgC9EXOvhj3znC5tjScmOclMBI2vArmTbFQ+2FX3nYuWFV+z6PgZoSZJYvHrPZ
	 Uw6nq+uPcpUyOkMuiF0eD8lwHjnxJqFJMQXhWOb0cZYZrk0xbG37uYBtMWZMFQR01U
	 heAP9PWzXct7w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 6/6] kho/abi: add memblock ABI header
In-Reply-To: <20260105165839.285270-7-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:39 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-7-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:31:12 +0000
Message-ID: <2vxzqzrkckkv.fsf@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-73297-lists,linux-doc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 35EE049985
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Introduce KHO ABI header describing preservation ABI for memblock's
> reserve_mem regions and link the relevant documentation to KHO docs.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
[...]
> + *	/ {
> + *		compatible = "memblock-v1";
> + *
> + *		n1 {
> + *			compatible = "reserve-mem-v1";
> + *			start = <0xc06b 0x4000000>;
> + *			size = <0x04 0x00>;
> + *		};
> + *	};
> + *
> + * Main memblock node (/):
> + *
> + *   - compatible: "memblock-v1"
> +
> + *     Identifies the overall memblock ABI version.
> + *
> + * reserved_mem node:
> + *   These nodes describe all reserve_mem regions.
> + *
> + *   - compatible: "reserve-mem-v1"
> + *
> + *     Identifies the ABI version of reserve_mem descriptions
> + *
> + *   - start: u64
> + *
> + *     Physical address of the reserved memory region.
> + *
> + *   - size: u64
> + *
> + *     size in bytes of the reserved memory region.

I think you should also mention that the name of the node is the name of
the map.

Other than this,

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

> + */
> +
> +/* Top level memblock FDT node name. */
> +#define MEMBLOCK_KHO_FDT "memblock"
> +
> +/* The compatible string for the memblock FDT root node. */
> +#define MEMBLOCK_KHO_NODE_COMPATIBLE "memblock-v1"
> +
> +/* The compatible string for the reserve_mem FDT nodes. */
> +#define RESERVE_MEM_KHO_NODE_COMPATIBLE "reserve-mem-v1"
> +
> +#endif /* _LINUX_KHO_ABI_MEMBLOCK_H */
[...]

-- 
Regards,
Pratyush Yadav

