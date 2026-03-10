Return-Path: <linux-doc+bounces-78569-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE7yFGeir2nvbAIAu9opvQ
	(envelope-from <linux-doc+bounces-78569-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 05:47:35 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E02C02454E2
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 05:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3A72B302B199
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 04:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49D603A900B;
	Tue, 10 Mar 2026 04:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubzN8uNf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19A03B3BE3
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 04:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773118052; cv=none; b=W9iCJpXUIQiZR8v1F/dFbrsGsyuSkc/Rit+FHxsKE6ACVLwKUQqgVm7FOS38F5zSCQo2up/tY6dxY0zwk7LQ8KmZ7tP71m1+7waLuenwZNMmWE6NzHx+LUCl6gqdnCwRMKinNOqFoB74f65QoZfMa7Mh7tVxckqXueo6PJjTGJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773118052; c=relaxed/simple;
	bh=RqKqnpTcfCZI3hFTmKFbeJPUk2jsyCxOq5Hii3rlEWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R10DDp8WNrE7Amgpbmly1eaZI53Obk+YWiew8IDKjDFmwGNcgDrd/Og2YAe6bpCnFfreQD5QyatiV7xgLdFksukKa1AEu2lAxWrf9YpBLJrj8BB3EA+NtPIU5QmNB7V0dxrIwqc+KYfWMhGMhOh23UwWtgNOsDfgBBoeFR8koTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubzN8uNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C1CC2BCB2
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 04:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773118051;
	bh=RqKqnpTcfCZI3hFTmKFbeJPUk2jsyCxOq5Hii3rlEWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ubzN8uNfufxX6KIDipsjLcZc1QGTqzMznJ0fg7PTaJQaOlJABMOIcN32NE7TQFxEM
	 de4WIrOdl6Tr4Lil9IYnl6KX7qIgILUhUAq78Ps2gixnVh9zDRzz7XkBqGI859rFgq
	 wpai/85n5rJbiCm9bkyISlnFNFvCreFzUhiw6gShnQ+DS8wgV1YJuGTHJdbWi3LtdW
	 IWkVyt7PKYhTkx+MH7E9ARKCjYkG84nCeqWMDWZPszfI8E5D2HDFc5ZmxpF3ikHrcq
	 QB9UiQbSeJ9U+OV0sm0RHbJRqsZ6Moo3k3X/jDeHo2Wyg66hyAVViBEFK2tggSzZFN
	 uXvI06L4dFESA==
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so585284c88.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 21:47:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXGKyQoXriGtJPD2kMVhYv9XTwf1Y2oKneVNkRcYZuRYfGwr8pC8jhGQqXO7tpxNqEWnC2jHLOhl9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhZslLf3/kYXiY4iNrUY92YQsiY+FFv4uPXU0vijFMzOgCtvLs
	qrNK40oZyM4SI5lN6OhU8yDrOqUX75AHaIOUalNhGU1hdfJhM4J3pUGXFtLDQbfHtPhXavaG3yL
	+9/lALgRs9sjrz+52D1dkKg4fTXVv+3c=
X-Received: by 2002:a05:7022:698b:b0:128:d967:4674 with SMTP id
 a92af1059eb24-128d9674d0bmr2199641c88.19.1773118050845; Mon, 09 Mar 2026
 21:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308180734.5792-1-evan.j.ducas@gmail.com>
In-Reply-To: <20260308180734.5792-1-evan.j.ducas@gmail.com>
From: Fan Wu <wufan@kernel.org>
Date: Mon, 9 Mar 2026 21:48:09 -0700
X-Gmail-Original-Message-ID: <CAKtyLkExDU8=ovSBA8NLhzTBy393A8KZYZ=36VjkwKOj6FMTAw@mail.gmail.com>
X-Gm-Features: AaiRm520XhD3p6NGuquRd2scdyWe0zt3ypb5BgKWqlcD7X1YAnLqms7wWEn9lH4
Message-ID: <CAKtyLkExDU8=ovSBA8NLhzTBy393A8KZYZ=36VjkwKOj6FMTAw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: security: ipe: fix typos and grammar
To: Evan Ducas <evan.j.ducas@gmail.com>
Cc: wufan@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, bagasdotme@gmail.com, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: E02C02454E2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-78569-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wufan@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 11:09=E2=80=AFAM Evan Ducas <evan.j.ducas@gmail.com>=
 wrote:
>
> Fix several spelling and grammar mistakes in the IPE
> documentation.
>
> No functional change.
>
> Signed-off-by: Evan Ducas <evan.j.ducas@gmail.com>
> ---
Applied to ipe/next. Thanks.

-Fan

