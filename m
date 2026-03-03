Return-Path: <linux-doc+bounces-77726-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLgyLtQZp2m+dgAAu9opvQ
	(envelope-from <linux-doc+bounces-77726-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:26:44 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C7C1F49B8
	for <lists+linux-doc@lfdr.de>; Tue, 03 Mar 2026 18:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 887763030E85
	for <lists+linux-doc@lfdr.de>; Tue,  3 Mar 2026 17:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC95737188C;
	Tue,  3 Mar 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ivq/Jzm/"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F2370D5F;
	Tue,  3 Mar 2026 17:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558774; cv=none; b=L+Qxp0gok54MqA2aHcoVeqjC6PpZzR1ffC7qtACYprZqyBSFKtBOP5oRYjjUhCSOrDHx5OQk8sNi1Y554A0TMbfdqPjsOLoV2SI6DyCbIwvrJylzrAXCFsocdJOJ2Q4Oez+91OxgSqT9NsMJzd9vYVqUk9VGQBn/HZ4kCTx7Ofo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558774; c=relaxed/simple;
	bh=liu2PS7gy1zOpGzIYktYQIUF4fPT8VoxDeBK04WKARs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S40Zc710issbaJGptKzs4OKKe5YjChYtLGoobWwWEqF4vapCMdcjChWVFldpf8xb5CqzoDHeDz+e9S/gIMJemrFoQ/InmZHWSyaViLD69LOAQ6gNqH26/dyQAfQFD80Vh6EgnNFD8HN05imHKvOj3YCjiuYnCsChur2YXqjynVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ivq/Jzm/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D30B540429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772558773; bh=Q8XQYe0wBi4Y/l1CoYV2FRB33evwiv4YUj2pLhDPaOo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ivq/Jzm/XsTvEd5LSWFsUSzOU6pYMs8ICd7RjIq59WDeSPUx4C7hJi2jFceXkvbdR
	 ISP0MWd1l2drZmNHtFgLuue5Nn9UjeIj0tXkUdXjbVG+w3HLeVTpxvFoTbUssbK89i
	 G41fnx0sLxzIkN/EH7n0cThMs1tW1KiZ6IP7Dgtmw62ewDyMjOeHEzcfbmFcTsEgt+
	 osScXLVCwT/Jx2qUNdS/bk//IVTEx4zsta5QWvVZg7oloUh6KjgXH1ILGXaabx20lr
	 2QVEkZRWfmNiwXaea+WoBXLbMOfpsDzRv5EXm/7XNLY35yF5ceDh8PbYLGlQiiNcAV
	 QEMSrcSGSCVVg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D30B540429;
	Tue,  3 Mar 2026 17:26:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>
Subject: Re: [PATCH v3] docs: ja_JP: process: translate first half of
 'Describe your changes'
In-Reply-To: <56eb6125-3031-40aa-af94-2b4ad5787966@gmail.com>
References: <20260225154706.5457-1-weibu@redadmin.org>
 <56eb6125-3031-40aa-af94-2b4ad5787966@gmail.com>
Date: Tue, 03 Mar 2026 10:26:12 -0700
Message-ID: <87wlzsbz9n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 37C7C1F49B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77726-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,redadmin.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,trenco.lwn.net:mid,redadmin.org:email]
X-Rspamd-Action: no action

Akira Yokosawa <akiyks@gmail.com> writes:

> Hi Kurita-san,
>
> On Thu, 26 Feb 2026 00:47:06 +0900, Akiyoshi Kurita wrote:
>> Translate the first half of the "Describe your changes" section in
>> Documentation/translations/ja_JP/process/submitting-patches.rst.
>>=20
>> Replace "=E8=AA=AC=E6=98=8E=E3=81=99=E3=82=8B" with "=E8=A8=98=E8=BF=B0=
=E3=81=99=E3=82=8B" to match the distinction used in
>> ja_JP/process/howto.rst, and adjust line wrapping to ~74 columns.
>
> Your line wrapping still looks ~60 columns to me ..., but that can be
> tweaked after the fact.
>
> Currently, I'm kind of distracted by other issues and can't do in-depth
> review promptly.
>
> Jon, I'm OK with v3 merged as is.  So,
>
>> Avoid cross-references for now by adding TODO notes to convert them to
>> file-local references when the destinations are translated.
>>=20
>> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
>
> Acked-by: Akira Yokosawa <akiyks@gmail.com>

OK, applied, thanks as always,

jon

