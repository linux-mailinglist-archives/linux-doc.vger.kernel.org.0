Return-Path: <linux-doc+bounces-80671-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBEvNdEkwWmTQwQAu9opvQ
	(envelope-from <linux-doc+bounces-80671-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 12:32:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ECF2F141B
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 12:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4685C3047E71
	for <lists+linux-doc@lfdr.de>; Mon, 23 Mar 2026 11:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B735370D59;
	Mon, 23 Mar 2026 11:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qganW63i"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAA6340281;
	Mon, 23 Mar 2026 11:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264934; cv=none; b=i0fDTvoF/aWpi5/iqlBsdHpBD4qfh7xkfzBOSuSz3m9lsLD2gjxHTftd2VGPCGWCGYqx2HEO9YgdYNSg+ImkLZO9R8r6lBTzO8cAez4UWEJgav3Ye6hbknUSTLDTeEuH5UTDO71u5HQ8WAY2m3ieO3SQQ/OBUgH2phDCYLDTwE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264934; c=relaxed/simple;
	bh=go8U1XtnO0q6YRwkROqXDA629zNBZ7J7tyDxLbpQpm8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=qbGEQuG7pZ5oHrVb+cz4bO3mnB7i7gEc7xHqaX/nQZ5snz0t0+X/jYhP8X19xra5/I4utGb38Tzshf2gXeEsMPRNG2AI1rxAeFG+ot6olmNcYE/HOkv2OUoNARe3ratIDzNbGbGiKsoPZVMMutUljbzLUV1OyN5SxEQiS2EaOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qganW63i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5093C4CEF7;
	Mon, 23 Mar 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774264934;
	bh=go8U1XtnO0q6YRwkROqXDA629zNBZ7J7tyDxLbpQpm8=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=qganW63irxdnYI/+eikR1+lCUs8AqhHmM7rj2xJHEBn+59kLGkqSVYmZiDkVFBS95
	 cmca6THQy2FnHPFS6cd554eS7tXPqtyoq+Iv3eVHl927FQnLZpEbA8CkANFeInLSN6
	 RuoeDnlgp1nC1oswGglYZYIK46KcpyfG6JKX2fiL1PGSCToSmAqpdZGgACYfxF2l+M
	 1+YTwyn6WkWFVkSkcolOY7LdkYFaZzT+VPhU6dxKAlwk5xTsW2trRRUYXc85CgYshV
	 jKb3EVvd3uZQqa9qG75HZiv/dPoSAztGvEQthdpFZuU1Bk13gxytjEkUsuUPxnJhZ0
	 mQ23uAIOgGpgw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 12:22:08 +0100
Message-Id: <DHA4FBLCHNG0.3D8IVG2GFQRLP@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 07/10] gpu: nova-core: falcon: introduce
 `bounded_enum` macro
Cc: "Alice Ryhl" <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260323-b4-nova-register-v3-0-ae2486ecef1b@nvidia.com>
 <20260323-b4-nova-register-v3-7-ae2486ecef1b@nvidia.com>
In-Reply-To: <20260323-b4-nova-register-v3-7-ae2486ecef1b@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,garyguo.net,protonmail.com,umich.edu,nvidia.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-80671-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email,nvidia.com:email]
X-Rspamd-Queue-Id: 56ECF2F141B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon Mar 23, 2026 at 12:07 PM CET, Alexandre Courbot wrote:
> Introduce a powered-up version of our ad-hoc `impl_from_enum_to_u8`
> macro that allows the definition of an enum type associated to a
> `Bounded` of a given width, and provides the `From` and `TryFrom`
> implementations required to use that enum as a register field member.
>
> The next patch will make use of it to convert all falcon registers to
> the kernel register macro.
>
> The macro is unused in this patch: it is introduced ahead-of-time to
> avoid diff mingling in the next patch that would make it difficult to
> review.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 82 +++++++++++++++++++++++++++++++++++=
++++++

Why does this live in falcon.rs?

